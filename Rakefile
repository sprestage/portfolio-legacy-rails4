#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Portfolio::Application.load_tasks

# This tells minitest to test the things from the test/features directory.  Without this,
#   the tests in the test/features directory will not be run.  -sprestage
MiniTest::Rails::Testing.default_tasks << 'features'
