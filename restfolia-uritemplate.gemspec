# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "restfolia-uritemplate/version"

Gem::Specification.new do |s|
  s.name              = "restfolia-uritemplate"
  s.version           = Restfolia::Uritemplate::VERSION
  s.author            = "Nadilson"
  s.email             = "nadilsons@gmail.com"
  s.homepage          = "https://github.com/nadilsons/restfolia-uritemplate"
  s.summary           = "Adds support to uri-templates in the dsl restfolia"
  s.description       = "Adds support to uri-templates in the dsl restfolia. See http://tools.ietf.org/html/rfc6570"

  s.files             = Dir["lib/**/*,*.gemspec}"]
  s.test_files        = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_dependency "restfolia"    , "~> 1.0.1"
  s.add_dependency "uri_template" , "~> 0.3.0"

  s.add_development_dependency  "fakeweb", '1.3.0'
  s.add_development_dependency  "rake", ">= 12.3.3"
  s.add_development_dependency  "rspec"  , "~> 2.8.0"
end
