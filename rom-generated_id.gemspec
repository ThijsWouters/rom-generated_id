# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rom/generated_id/version'

Gem::Specification.new do |spec|
  spec.name          = "rom-generated_id"
  spec.version       = ROM::GeneratedId::VERSION
  spec.authors       = ["Thijs Wouters"]
  spec.email         = ["thijs@morewood.be"]

  spec.summary       = "This gem generates an id when creating a new tuple."
  spec.homepage      = "https://github.com/ThijsWouters/rom-generated_id"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rom', "~> 0.7"
  spec.add_development_dependency "thread_safe"
  spec.add_development_dependency "inflecto"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
