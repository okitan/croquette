require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'croquette'
    gem.summary = 'execute command line and serve its result on the same web server'
    gem.description = 'execute command line and serve its result on the same web server'
    gem.email = 'okitakunio@gmail.com'
    gem.homepage = 'http://github.com/okitan/croquette'
    gem.authors = ['okitan']

    [ [ 'rack', '>= 1.2.1'],
    ].each do |name, version|
      gem.add_dependency name, version
    end
    
    gem.add_development_dependency 'rspec', '>= 1.3.0'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.rdoc_dir = 'doc'
  rdoc.title = "croquette #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
