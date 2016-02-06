# Ruby API client for ONTRAPORT

[![GitHub](https://img.shields.io/badge/github-ontraport--ruby-blue.svg)](http://github.com/hamzatayeb/ontraport-ruby)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://rubydoc.info/github/hamzatayeb/ontraport-ruby/)
[![License](http://img.shields.io/badge/license-MIT-yellowgreen.svg)](#license)
<!--
[![Build Status](https://travis-ci.org/hamzatayeb/ontraport-ruby.svg?branch=master)](https://travis-ci.org/hamzatayeb/ontraport-ruby)
-->

Disclaimer - This Gem is a work in progress.

<!-- Installation
------------

### Bundler

Add the Ontraport gem to your Gemfile:

```ruby
gem 'ontraport', '~> 1.0.0'
```

### Manual

Install the Gem from your terminal -

```bash
gem install ontraport
```
-->

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

If you have a question or a bug report, feel free to -

* [file an issue][issues]
* [send me an email](mailto:hamza.tayeb@gmail.com)

License
-------

The project uses the MIT License. See LICENSE.md for details.

[issues]: https://github.com/hamzatayeb/ontraport-ruby/issues
[semver]: http://semver.org
[rubydoc]: http://www.rubydoc.info/github/hamzatayeb/ontraport-ruby/