require 'rake'
require 'rake/testtask'
require 'rdoc/task'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the zoneless_time plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the zoneless_time plugin.'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ZonelessTime'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'zoneless_time'
    gem.summary = 'TimeWithoutZone support for ActiveRecord'
    gem.files = Dir["{lib}/**/*"]
    gem.authors = ['Shaun Mangelsdorf']
    gem.version = '0.1'
  end
rescue LoadError
  puts "Jeweler could not be sourced"
end
