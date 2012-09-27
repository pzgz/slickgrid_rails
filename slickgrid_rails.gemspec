# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slickgrid_rails/version'

Gem::Specification.new do |gem|
  gem.name          = "slickgrid_rails"
  gem.version       = SlickgridRails::VERSION
  gem.authors       = ["Leon Guan"]
  gem.email         = ["leon.guan@gmail.com"]
  gem.description   = %q{Simple gem wrap up the slickgrid jquery plugin}
  gem.summary       = %q{Simple gem wrap up the slickgrid jquery plugin}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
