Gem::Specification.new do |s|
  s.name        = 'Skynet'
  s.version     = '0.0.10'
  s.date        = '2020-03-16'
  s.licenses    = nil
  s.summary     = 'Sia skynet gem'
  s.description = 'Ruby gem for integrating Sias Skynet into Ruby apps'
  s.authors     = ['beyarz']
  s.email       = ''
  s.files       = ['lib/skynet.rb', 'lib/skynet/download.rb', 'lib/skynet/upload.rb']
  s.add_dependency 'httparty', '~> 0.18.0'
  s.homepage    = 'https://rubygems.org/gems/sia-skynet'
  s.metadata    = { 'source_code_uri' => 'https://github.com/beyarz/sia-skynet' }
end
