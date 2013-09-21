# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'site_info/version'

Gem::Specification.new do |spec|
  spec.name          = "site_info"
  spec.version       = SiteInfo::VERSION
  spec.authors       = ["Matthew Hirst"]
  spec.email         = ["hirst.mat@gmail.com"]
  spec.description   = %q{A simple no-frills gem. I found the other gems a bit cumbersome because all I want is the title and favion for a given url.}
  spec.summary       = %q{A simple gem for getting some information about a website. At the moment: favicon & title. More info in the future.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
