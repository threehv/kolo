# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kolo/version'

Gem::Specification.new do |spec|
  spec.name          = "kolo"
  spec.version       = Kolo::VERSION
  spec.authors       = ["Rahoul Baruah"]
  spec.email         = ["rahoul@3hv.co.uk"]
  spec.description   = "A quick way to set up a Rails app with Bootstrap and KnockoutJS"
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "LGPL"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
