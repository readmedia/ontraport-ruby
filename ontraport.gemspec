require File.expand_path('../lib/ontraport/version', __FILE__)

Gem::Specification.new do |s|
  s.name                  = 'ontraport'
  s.version               = Ontraport::VERSION
  s.date                  = Time.now.strftime('%Y-%m-%d')
  s.summary               = 'API client for ONTRAPORT - http://ontraport.com'
  s.description           = <<-eof
    This Gem implements the ONTRAPORT JSON API. Basic data retrieval and
    manipulation operations are supported.

    Full details on the API can be found at https://api.ontraport.com/doc/
  eof
  s.author                = 'Hamza Tayeb'
  s.email                 = 'hamza.tayeb@gmail.com'
  s.platform              = Gem::Platform::RUBY
  s.extra_rdoc_files      = ['README.md', 'LICENSE.md', 'CHANGELOG.md']
  s.files                 = Dir.glob("{lib}/**/*") + s.extra_rdoc_files
  s.homepage              = 'https://github.com/hamzatayeb/ontraport-ruby'
  s.license               = 'MIT'
  s.required_ruby_version = '~> 2'
  s.add_dependency 'httparty', ['~> 0.13']
end
