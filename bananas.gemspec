# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bananas/version'

Gem::Specification.new do |spec|
  spec.name          = "bananas"
  spec.version       = Bananas::VERSION
  spec.authors       = ["nitroo"]
  spec.email         = ["brysoncmyers@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://rubygems.org"
  end

  spec.summary       = %q{A library that finds monkey patches.}
  spec.description   = %q{Bananas is a library for displaying monkey patches defined on a given tree of objects. It uses simple criterion to introspect an object for externally-defined methods. It is intended to be used for debugging.}
  spec.homepage      = "https://github.com/nitroo/bananas"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["bananas"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
