require "bundler/gem_tasks"
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the saw plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the saw plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Saw'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README', 'CHANGELOG', 'LICENSE')
  rdoc.rdoc_files.include('lib/**/*.rb')
end