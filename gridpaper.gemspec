# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gridpaper/version"

Gem::Specification.new do |s|
  s.name        = "Gridpaper"
  s.version     = Gridpaper::VERSION
  s.authors     = ["Christian Naths"]
  s.email       = ["christiannaths@gmail.com"]
  s.homepage    = "http://christiannaths.com"
  s.summary     = %q{A SASS Framework}
  s.description = %q{Gridpaper is a CSS framework built on top of SASS.}

  s.rubyforge_project = "Gridpaperform"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("commander", '>= 4.0.4')
  s.add_dependency("sass", '>=3.1.7')
  s.add_dependency("guard", '>=0.8.8')
  s.add_dependency("guard-sass", '>=0.5.4')
  s.add_dependency("colorize", '>= 0.5.8')
end
