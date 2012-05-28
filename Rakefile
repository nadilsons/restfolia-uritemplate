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

desc "Run RSpec code examples with rcov"
RSpec::Core::RakeTask.new("spec:rcov") do |t|
  t.rcov = true
  system("rm -rf #{File.dirname(__FILE__)}/coverage")
  t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/,features\/,\/var\/lib}
  t.rcov_opts << %[-o "coverage"]
end

desc "Run RSpec code examples with rcov and ci_reporter"
task :build do |t|
  ENV["CI_REPORTS"] = "reports"
  Rake::Task['ci:setup:rspec'].invoke
  Rake::Task['spec:rcov'].invoke
end

task :default => :spec
