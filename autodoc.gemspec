# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "autodoc/version"

Gem::Specification.new do |spec|
  spec.name          = "autodoc"
  spec.version       = Autodoc::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "Auto-generate JSON API documents from your request-specs."
  spec.homepage      = "https://github.com/r7kamura/autodoc"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 3.0.0"
  spec.add_dependency "actionpack"
  spec.add_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rails", "5.2.2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "sqlite3"
end
