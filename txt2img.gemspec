# -*- encoding: utf-8 -*-
require File.expand_path('../lib/txt2img/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Hooopo"]
  gem.email         = ["hoooopo@gmail.com"]
  gem.description   = %q{generate image from txt}
  gem.summary       = %q{generate image from txt}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "txt2img"
  gem.require_paths = ["lib", "fonts"]
  gem.version       = Txt2img::VERSION
  gem.add_runtime_dependency "quick_magick_hooopo", ["~> 0.8"]
  gem.add_runtime_dependency "unicode-display_width", ["~> 0.1.1"]
end
