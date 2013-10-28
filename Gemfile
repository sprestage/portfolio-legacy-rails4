source 'https://rubygems.org'
# Specify ruby version for Heroku deploy
ruby '2.0.0'

gem 'rails', '3.2.15'
gem 'pg'
gem 'devise'
gem 'omniauth'
gem 'pundit'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '>= 3.2' # sass-rails needs to be higher than 3.2
  gem 'bootstrap-sass', '~> 2.3.2.1'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'minitest', '> 4.0'
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'launchy'
  gem 'minitest-focus'
  gem 'minitest-colorize'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-debugger'
  gem 'faker'
  gem 'figaro'
end

group :test do
  gem 'turn'
  gem 'simplecov', :require => false, :group => :test
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
