source 'https://rubygems.org'
# Specify ruby version for Heroku deploy
ruby '2.2.1'

gem 'rails', '4.2.7.1'
gem 'pg'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'pundit'
gem 'coveralls', :require => false

# Rails 4.2 upgrade extracted respond_with and respond_to into the responders gem.
gem 'responders', '~> 2.0'

# Might need this for rails 4.2.
# gem 'rails-deprecated_sanitizer'

gem 'protected_attributes'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails' # sass-rails needs to be higher than 3.2
  gem 'bootstrap-sass'
  gem 'bootstrap-will_paginate'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'minitest'
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'launchy'
  gem 'minitest-focus'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'faker'
  gem 'figaro'
end

group :development do
  gem 'guard-minitest'

  # Simply drop a reference to the console helper (i.e., <%= console %>)
  # into any view you want to enable it for. A console will also be
  # provided on any error page you view in your development environment.
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'simplecov', :require => false, :group => :test
end

gem 'spork-minitest'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
