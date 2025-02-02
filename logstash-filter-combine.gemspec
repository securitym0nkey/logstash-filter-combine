Gem::Specification.new do |s|
  s.name          = 'logstash-filter-combine'
  s.version       = '0.1.1'
  s.licenses      = ['MIT']
  s.summary       = 'Logstash Filter Plugin to combine fields into an array'
  s.description   = 'A logstash filter for combining multiple source fields into a target array.'
  s.homepage      = 'https://github.com/securitym0nkey/logstash-filter-combine'
  s.authors       = ['Julian Wecke']
  s.email         = 'julian@wecke.me'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 2.0"
  s.add_development_dependency 'logstash-devutils', '~> 0'
end
