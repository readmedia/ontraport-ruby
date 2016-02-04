Gem::Specification.new do |s|
  s.name        = 'ontraport'
  s.version     = '0.0.0'
  s.date        = '2016-02-04'
  s.summary     = 'API client for ONTRAPORT - http://ontraport.com'
  s.description = s.summary
  s.authors     = ['Hamza Tayeb']
  s.email       = 'hamza.tayeb@gmail.com'
  s.files       = ['lib/ontraport.rb']
  s.homepage    = 'https://github.com/hamzatayeb/ontraport-ruby'
  s.license     = 'MIT'
  s.required_ruby_version = '~> 2.3.0'
  s.add_runtime_dependency 'httparty', ['~> 0.13']
end