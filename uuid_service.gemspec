# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uuid_service/version'

Gem::Specification.new do |spec|
  spec.name          = "uuid_service"
  spec.version       = UuidService::VERSION
  spec.authors       = ["James Glover"]
  spec.email         = ["james.glover@sanger.ac.uk"]
  spec.summary       = %q{A simple webservice to supply UUIDs}
  spec.description   = %q{A simple webservice to supply UUIDs}
  spec.homepage      = "http://www.github.com/sanger"
  spec.license       = "GNU GPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "puma"
  spec.add_runtime_dependency "rack-accept"
end
