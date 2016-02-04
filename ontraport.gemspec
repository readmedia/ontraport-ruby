Gem::Specification.new do |s|
  s.name        = 'ontraport'
  s.version     = '0.0.0'
  s.date        = '2016-02-04'
  s.summary     = 'Ruby client for ONTRAPORT'
  s.description = 'A simple hello world gem'
  s.authors     = ['Hamza Tayeb']
  s.email       = 'hamza.tayeb@gmail.com'
  s.files       = ['lib/ontraport.rb']
  s.homepage    = 'https://github.com/hamzatayeb/ontraport-ruby'
  s.license     = 'MIT'
  s.add_runtime_dependency 'httparty', ['>= 0.13.7']
end