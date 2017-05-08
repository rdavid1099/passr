# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'passr/version'

Gem::Specification.new do |spec|
  spec.name          = "passr"
  spec.version       = Passr::VERSION
  spec.authors       = ["Ryan Workman"]
  spec.email         = ["rdavid1099@gmail.com"]

  spec.summary       = %q{Generates random passwords of a given length encrypted using RbNaCl}
  spec.description   = %q{Passr is a simple Ruby gem handling password generation, encryption and decryption.}
  spec.homepage      = "https://github.com/rdavid1099/passr"
  spec.license       = "MIT"
  spec.bindir        = "exe"
  spec.has_rdoc      = "yard"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "simplecov", "0.14.1"
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency "yard", "0.9.9"
  spec.add_dependency "rbnacl-libsodium", "1.0.11"
  spec.add_dependency "thor"
end
