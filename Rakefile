require 'rdoc/task'

RDoc::Task.new :document do |opt|
  opt.rdoc_dir = 'docs/'
  opt.title    = "Skynet rubygem2"
  opt.main = "README_md.html"

  opt.options << '--line-numbers' << '--inline-source'
  opt.options << '--charset' << 'utf-8'

  opt.rdoc_files.include("README.md", "EXAMPLES.md", "LICENSE", "", "lib/*.rb", "lib/skynet/*.rb")
  opt.rdoc_files.exclude('Gemfile.lock')
  opt.rdoc_files.exclude('Gemfile')
  opt.rdoc_files.exclude('block.md')
  opt.rdoc_files.exclude('mine.rb')
end
