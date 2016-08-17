require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  require 'simplecov'
  require 'coveralls'

  formatters = [SimpleCov::Formatter::HTMLFormatter]
  formatters << Coveralls::SimpleCov::Formatter if ENV['COVERALLS_REPO_TOKEN']
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]

  SimpleCov.start 'rails'

  ENV["RAILS_ENV"] = "test"
  require File.expand_path("../../config/environment", __FILE__)
  require "rails/test_help"
  require "minitest/rails"
  require "minitest/rails/capybara"
  require "minitest/focus"

  # To add Capybara feature tests add `gem "minitest-rails-capybara"`
  # to the test group in the Gemfile and uncomment the following:
  # require "minitest/rails/capybara"

  # Uncomment for awesome colorful output
  require "minitest/pride"

  class ActionDispatch::IntegrationTest
    include Rails.application.routes.url_helpers
    # include Capybara::RSpecMatchers
    include Capybara::DSL
    include Capybara::Assertions
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
  class ActiveSupport::TestCase
    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def sign_in
      visit new_user_session_path
      fill_in 'Login', with: users(:user_one).email
      fill_in 'Password', with: "password"
      click_on 'Sign in'
      page.must_have_content "Signed in successfully"
    end

    def sign_in_author
      visit new_user_session_path
      fill_in 'Login', with: users(:author).email
      fill_in 'Password', with: "password"
      click_on 'Sign in'
      page.must_have_content "Signed in successfully"
    end

    def sign_in_editor
      visit new_user_session_path
      fill_in 'Login', with: users(:editor).email
      fill_in 'Password', with: "password"
      click_on 'Sign in'
      page.must_have_content "Signed in successfully"
    end

    def sign_out
      visit static_construction_path
      click_on 'Sign Out'
      # Then I should see the logged out message
      page.text.must_include "Signed out successfully"
      page.wont_have_content "Sign Out"
    end

  end
end

# --- Instructions ---
# Sort the contents of this file into a Spork.prefork and a Spork.each_run
# block.
#
# The Spork.prefork block is run only once when the spork server is started.
# You typically want to place most of your (slow) initializer code in here, in
# particular, require'ing any 3rd-party gems that you don't normally modify
# during development.
#
# The Spork.each_run block is run each time you run your specs.  In case you
# need to load files that tend to change during development, require them here.
# With Rails, your application modules are loaded automatically, so sometimes
# this block can remain empty.
#
# Note: You can modify files loaded *from* the Spork.each_run block without
# restarting the spork server.  However, this file itself will not be reloaded,
# so if you change any of the code inside the each_run block, you still need to
# restart the server.  In general, if you have non-trivial code in this file,
# it's advisable to move it into a separate file so you can easily edit it
# without restarting spork.  (For example, with RSpec, you could move
# non-trivial code into a file spec/support/my_helper.rb, making sure that the
# spec/support/* files are require'd from inside the each_run block.)
#
# Any code that is left outside the two blocks will be run during preforking
# *and* during each_run -- that's probably not what you want.
#
# These instructions should self-destruct in 10 seconds.  If they don't, feel
# free to delete them.
