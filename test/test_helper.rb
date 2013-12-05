require 'simplecov'
SimpleCov.start 'rails'
require 'coveralls'
Coveralls.wear!
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
require "minitest/colorize"
require "minitest/pride"

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
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  # include Capybara::RSpecMatchers
  include Capybara::DSL
  include Capybara::Assertions
end
