# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git"}

gem 'rails', '5.2.8.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.0.0', require: false
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'rake'

gem 'bluecloth'
gem 'bootstrap-datepicker-rails'
gem 'formtastic'
gem 'haml'
gem 'high_voltage'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'nifty-generators'
gem 'sass'
gem 'wikipedia-client'

group :development, :test do
  gem 'listen', '>= 3.0.5', '< 3.2'
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
  gem 'sqlite3', '1.3.13'
  # gem 'capybara', # Latest capybara not supported < Ruby 2.3
end
