
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "to_dots/version"

Gem::Specification.new do |spec|
  spec.name          = "to_dots"
  spec.version       = ToDots::VERSION
  spec.authors       = ["Fletcher Fowler"]
  spec.email         = ["fletch@fzf.me"]

  spec.summary       = %q{Converts a Hash or Array into dot strings}
  spec.description   = %q{Converts a Hash or Array into dot strings}
  spec.homepage      = "http://github.com/fzf/to_dots"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
