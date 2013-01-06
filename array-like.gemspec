# -*- encoding: utf-8 -*-
require File.expand_path("../lib/array_like", __FILE__)

Gem::Specification.new do |gem|
  gem.name        =  "array_like"
  gem.description =  "Mix Array-like behaviors into your classes"
  gem.summary     =  "Mix Array-like behaviors into your classes"
  gem.authors     = ["Ian MacLeod"]
  gem.email       = ["ian@nevir.net"]
  gem.homepage    =  "https://github.com/nevir/rb-array-like"

  gem.version  = ArrayLike::VERSION
  gem.platform = Gem::Platform::RUBY

  gem.files      = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {spec}/*`.split("\n")

  gem.require_paths = ["lib"]
end
