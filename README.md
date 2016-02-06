# Ruby API client for ONTRAPORT

[![GitHub](https://img.shields.io/badge/github-ontraport--ruby-blue.svg)][repo]
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)][rubydoc]
[![License](http://img.shields.io/badge/license-MIT-yellowgreen.svg)](#license)

Overview
--------

This Gem implements ONTRAPORT's JSON REST API - that's a lot of capitals... but it's how they stylize their name :)

So far, all the [objects API][ontra-objects-api] methods are supported. Forthcoming releases will add support for the other APIs.

Usage
-----

```ruby
Ontraport.get_object :contact, 12345
#=> #<Ontraport::Response @data=...>
```

```ruby
Ontraport.save_or_update :contact, { email: 'foo@bar.com', firstname: 'Foo' }
#=> #<Ontraport::Response @data=...>
```

```ruby
Ontraport.tag_objects :contact, { add_list: '11111,22222', ids: '33333,44444' }
#=> #<Ontraport::Response @data=...>
```

See [documentation][rubydoc] for more details/examples.

Installation
------------

### Bundler

Add the Ontraport gem to your Gemfile:

```ruby
gem 'ontraport', '~> 0.1'
```

### Manual

Install the Gem from your terminal -

```bash
gem install ontraport
```

Configuration
-------------

In Rails, use an initializer to configure -

```ruby
# config/initializers/ontraport.rb
require 'ontraport'

Ontraport.configure do |config|
  config.api_id = 'foo'
  config.api_key = 'bar'
end
```

Contact
-------

If you have a suggestion or a bug report, please [file an issue][issues].

License
-------

The project uses the MIT License. See LICENSE.md for details.

[issues]: https://github.com/hamzatayeb/ontraport-ruby/issues
[rubydoc]: http://rubydoc.info/gems/ontraport
[repo]: http://github.com/hamzatayeb/ontraport-ruby
[ontra-objects-api]: https://api.ontraport.com/doc/#!/objects/