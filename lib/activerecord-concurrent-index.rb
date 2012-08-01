require "activerecord-concurrent-index/version"

module ActiveRecord
  module ConnectionAdapters # :nodoc:
    module SchemaStatements
      def without_transaction
        original_value = ActiveRecord::Base.connection.supports_ddl_transactions?
        commit_db_transaction unless outside_transaction?
        ActiveRecord::Base.connection.class_eval do
          def supports_ddl_transactions?
            false
          end
        end
        yield
      ensure
        if original_value
          ActiveRecord::Base.connection.class_eval do
            def supports_ddl_transactions?
              true
            end
          end
        end
      end

      def add_index_concurrently(table_name, column_name, options = {})
        column_names = Array.wrap(column_name)
        index_name   = index_name(table_name, :column => column_names)

        if Hash === options # legacy support, since this param was a string
          index_type = options[:unique] ? "UNIQUE" : ""
          index_name = options[:name].to_s if options.key?(:name)
        else
          index_type = options
        end

        if index_name.length > index_name_length
          raise ArgumentError, "Index name '#{index_name}' on table '#{table_name}' is too long; the limit is #{index_name_length} characters"
        end
        if index_name_exists?(table_name, index_name, false)
          raise ArgumentError, "Index name '#{index_name}' on table '#{table_name}' already exists"
        end
        quoted_column_names = quoted_columns_for_index(column_names, options).join(", ")

        without_transaction do
          execute "CREATE #{index_type} INDEX CONCURRENTLY #{quote_column_name(index_name)} ON #{quote_table_name(table_name)} (#{quoted_column_names})"
        end
      end
    end
  end
end
