#!/usr/bin/env rake
require 'rubygems'
require 'rake'
require 'rspec/core'
require 'rspec/core/rake_task'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

RSpec::Core::RakeTask.new(:spec)
task :default => :spec
