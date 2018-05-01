
lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "franklin/version"

Gem::Specification.new do |spec|
  spec.name          = "franklin"
  spec.version       = Franklin::VERSION
  spec.license       = "MIT"
  spec.authors       = ["Ylan Segal"]
  spec.email         = ["ylan@segal-family.com"]

  spec.summary       = "CLI utility for searching Overdrive-powered public libraries"
  spec.homepage      = "https://github.com/ylansegal/franklin"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mechanize", "~> 2.7"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "rubocop", "~> 0.49"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.00"
end
