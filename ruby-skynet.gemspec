Gem::Specification.new do |s|
  s.name        = 'ruby-skynet'
  s.version     = '1.1.16'
  s.date        = '2020-03-16'
  s.licenses    = 'MIT'
  s.summary     = 'Sia skynet gem'
  s.description = 'Ruby gem for integrating Sias Skynet into Ruby apps'
  s.authors     = ['beyarz']
  s.email       = ''
  s.files       = ['lib/ruby-skynet.rb', 'lib/skynet/download.rb', 'lib/skynet/helper.rb', 'lib/skynet/upload.rb']
  s.add_dependency 'httparty', '~> 0.18.0'
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rdoc", "~> 6.2"
  s.add_development_dependency "rspec", "~> 3.9"
  s.add_development_dependency "rubygems-tasks", "~> 0.2.5"
  s.homepage    = 'https://rubygems.org/gems/sia-skynet'
  s.metadata    = { 'source_code_uri' => 'https://github.com/beyarz/sia-skynet' }
end
