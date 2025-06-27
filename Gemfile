# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git"}

gem 'rails', '~> 7.1.0'
gem 'mysql2', '~> 0.5.0' # 0.5 and higher are not supported by Rails < 5'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.0.0', require: false
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'puma'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

gem 'rake'

gem 'bluecloth'
gem 'bootstrap-datepicker-rails'
gem 'formtastic'
gem 'haml'
gem 'high_voltage'
gem 'jquery-rails'
gem 'jquery-ui-rails','~> 8.0'
gem 'nifty-generators'
gem 'sass'
gem 'wikipedia-client'

group :development, :test do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'simplecov' # , '~> 0.15.1'
  gem 'test-unit'
end

group :assets do
  gem 'sassc-rails', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'minitest'
  gem 'rails-controller-testing' # necessary for controller testing in rails5?
  gem 'sqlite3', '~> 1.4'
  # gem 'capybara', # Latest capybara not supported < Ruby 2.3
end
