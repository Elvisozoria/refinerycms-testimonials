#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

ENGINE_PATH = File.dirname(__FILE__)
APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)

load 'rails/tasks/engine.rake' if File.exists?(APP_RAKEFILE)

Dir[File.expand_path('../tasks/**/*', __FILE__)].each do |task|
  load task
end

require "refinerycms-testing"
Refinery::Testing::Railtie.load_dummy_tasks ENGINE_PATH

desc "Build gem files for all projects"
task :build => "all:build"

task :default => :spec

