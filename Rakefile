# frozen_string_literal: true

require 'rdoc/task'
require 'rspec/core/rake_task'

desc 'Generate document'
RDoc::Task.new do |opt|
  opt.rdoc_dir = 'docs'
  opt.title = 'ruby-skynet gem'
  opt.main = 'README_md.html'
  opt.options << '--line-numbers'
  opt.options << '--charset' << 'utf-8'
  opt.rdoc_files.include('lib/*.rb', 'lib/skynet/*.rb', 'EXAMPLES.md', 'README.md')
end

desc 'Run rubocop'
task :lint do
  `rubocop`
end

desc 'Run rubocop with autofixable'
task :autolint do
  `rubocop -a`
end

desc 'Build gem'
task :build do
  `gem build ruby-skynet.gemspec`
end

desc 'Install gem'
task :install do
  file = Dir.glob('ruby-skynet-*.gem').first
  `gem install ruby-skynet-#{file}.gem`
end

desc 'Run tests'
RSpec::Core::RakeTask.new do |test|
  test.pattern = 'spec/*_spec.rb'
  test.verbose = false
end
