require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
 
desc 'Default: run unit tests.'
task :default => :test

desc 'Test the base58 library.'
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end

desc 'Generate RDoc documentation.'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'base58'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end