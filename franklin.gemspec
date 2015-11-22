# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "franklin/version"

Gem::Specification.new do |spec|
  spec.name          = "franklin"
  spec.version       = Franklin::VERSION
  spec.authors       = ["Ylan Segal"]
  spec.email         = ["ylan@segal-family.com"]

  spec.summary       = "CLI utility for searching Overdrive-powered public libraries"
  spec.homepage      = "https://github.com/ylansegal/franklin"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "pry"
end
