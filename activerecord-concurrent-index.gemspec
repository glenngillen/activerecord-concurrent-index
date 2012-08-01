# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activerecord-concurrent-index/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Glenn Gillen"]
  gem.email         = ["me@glenngillen.com"]
  gem.description   = %q{Concurrently adds database indexes}
  gem.summary       = %q{Extension to allow indexes to be added concurrently on supported databases (e.g., postgres)}
  gem.homepage      = "https://github.com/glenngillen/activerecord-concurrent-index"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activerecord-concurrent-index"
  gem.require_paths = ["lib"]
  gem.version       = Activerecord::Concurrent::Index::VERSION
  gem.add_dependency 'activerecord'
  gem.add_development_dependency 'rake'
end
