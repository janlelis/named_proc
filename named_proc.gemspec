# -*- encoding: utf-8 -*-

require File.expand_path('../lib/named_proc/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "named_proc"
  s.version     = NamedProc::VERSION
  s.authors     = ["Jan Lelis"]
  s.email       = "mail@janlelis.de"
  s.homepage    = "https://github.com/janlelis/named_proc"
  s.summary     = "NamedProc: Like anonymous procs, but have a name."
  s.description = "NamedProc: Like anonymous procs, but have a name. Example: lambda.codebrawl {} # creates an empty lambda with the name :codebrawl"
  s.files = Dir.glob %w{named_proc.gemspec lib/named_proc.rb lib/named_proc/version.rb lib/named_proc/implementation.rb lib/named_proc/core_ext.rb spec/named_proc_spec.rb}
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE.txt", "CHANGELOG.rdoc", ".travis.yml"]
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'rake', '~> 10.4'
end
