# ActiveRecord Concurrent Index

Extension to allow indexes to be added concurrently on supported
databases (e.g., postgres)

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'activerecord-concurrent-index'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install activerecord-concurrent-index
```

## Usage

Inside your database migration:

```ruby
def self.up
  add_index_concurrently :table_name, :field_to_index
end
```

## Why?

Postgres allows you to add an [index to a table concurrently](http://www.postgresql.org/docs/8.3/static/sql-createindex.html#SQL-CREATEINDEX-CONCURRENTLY)
which means it will not block regular database operations, such as inserts,
while the index is being applied. This is especially useful on production tables
with a lot of data where the time to create an index can be measured in seconds or
minutes rather than being near-instant. During this period, inserts to the
table will be blocked and users may ultimately experience an outage.

The downside to running indexes concurrently is that they will take longer to
be applied.

## Status

Production ready

## Bugs, Feature Requests, etc.

If you think you've found a bug or have a feature you'd like to contribute here are the ways to let me know, in order of likelihood for a speedy resolution:

Fork the repo, add a test, implement the feature, send me a pull request
Fork the repo, add a failing test, send me a pull request
Create an issue on Github.

## License

ActiveRecord Concurrent Index is released under the MIT license.

Copyright (c) 2012 Glenn Gillen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[![Analytics](https://ga-beacon.appspot.com/UA-46840117-1/activerecord-concurrent-index/readme?pixel)](https://github.com/igrigorik/ga-beacon)
