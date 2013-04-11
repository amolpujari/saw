require "bundler/gem_tasks"
require 'rake'
require 'rake/rdoctask'
require 'rspec/core/rake_task'

desc 'Default: run spec.'
task :default => :spec

RSpec::Core::RakeTask.new('spec') 

desc 'Generate documentation for the saw plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Saw'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README', 'CHANGELOG', 'LICENSE')
  rdoc.rdoc_files.include('lib/**/*.rb')
end