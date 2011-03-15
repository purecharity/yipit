# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yipit/version"

Gem::Specification.new do |s|
  s.name        = "yipit"
  s.version     = Yipit::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Josh Deeden"]
  s.email       = ["jdeeden@gmail.com"]
  s.homepage    = "http://github.com/jdeeden/yipit"
  s.summary     = %q{A simple wrapper for the Yipit API}
  s.description = %q{A simple wrapper for the Yipit API}

  s.rubyforge_project = "yipit"
  s.add_development_dependency('rake', '~> 0.8')
  s.add_development_dependency('rspec', '~> 2.5')
  s.add_development_dependency('simplecov', '~> 0.4')
  s.add_development_dependency('vcr', '~> 1.7.0')
  s.add_development_dependency('fakeweb')
  s.add_development_dependency('yard', '~> 0.6')
  s.add_development_dependency('maruku', '~> 0.6')
  s.add_runtime_dependency("faraday", '~> 0.5.7')
  s.add_runtime_dependency("faraday_middleware", '~> 0.3.2')
  s.add_runtime_dependency("typhoeus", '~> 0.2.4')
  s.add_runtime_dependency('hashie', '~> 1.0.0')
  s.add_runtime_dependency('multi_json', '~> 0.0.5')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
