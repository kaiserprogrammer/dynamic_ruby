# -*- coding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'dynamic_ruby'
  s.version = "2.0.1"
  s.author = 'Jürgen Bickert'
  s.homepage = 'https://github.com/kaiserprogrammer/dynamic_ruby'
  s.email = 'juergenbickert@gmail.com'
  s.license = "MIT"

  s.summary = "A library which correctly implements dynamic scope for ruby."
  s.description = "A thin wrapper around ruby for easy use of dynamic scope in your rubies"

  s.files = Dir.glob("{bin,lib,spec,features}/**/*")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.bindir = "bin"
  s.require_paths << "lib"
end
