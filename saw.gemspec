# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'saw/version'

Gem::Specification.new do |gem|
  gem.name          = "saw"
  gem.version       = Saw::VERSION
  gem.authors       = ["Amol Pujari"]
  gem.email         = ["amolpujari@gmail.com"]
  gem.description   = %q{User visits, hits tracking for Ruby on Rails}
  gem.summary       = %q{I saw user doing blah blha blah}
  gem.homepage      = %q{https://github.com/amolpujari/saw}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("rails", ">= 3.0.0")
  gem.add_development_dependency "rspec", "~> 2.6"
end
