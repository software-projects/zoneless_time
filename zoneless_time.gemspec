# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zoneless_time/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Shaun Mangelsdorf"]
  gem.email         = ["s.mangelsdorf@gmail.com"]
  gem.description   = %q{TimeWithoutZone support for ActiveRecord}
  gem.summary       = %q{TimeWithoutZone support for ActiveRecord}
  gem.homepage      = "https://github.com/smangelsdorf/zoneless_time"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zoneless_time"
  gem.require_paths = ["lib"]
  gem.version       = ZonelessTime::VERSION
end
