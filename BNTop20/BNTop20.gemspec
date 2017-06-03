# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "BNTop20/version"

Gem::Specification.new do |spec|
  spec.name          = "BNTop20"
  spec.version       = BNTop20::VERSION
  spec.authors       = ["Nathan Campbell"]
  spec.email         = ["nathancampbell@outlook.com"]

  spec.summary       = %q{This gem retrieves the top 20 novels from Barnes and Noble's bestselling list.}
  spec.description   = %q{Retrieves the title, author, date published and current price.}
  spec.homepage      = "https://github.com/chipsaboy/BNTop20-cli-gem"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
