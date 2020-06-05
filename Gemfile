# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails', '5.2.4.3'
gem 'bootsnap'
gem 'listen'

gem 'rake'

gem 'bluecloth'
gem 'bootstrap-datepicker-rails'
gem 'formtastic'
gem 'haml'
gem 'high_voltage'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'mysql2', '~> 0.5.0' # 0.5 and higher are not supported by Rails < 5
gem 'nifty-generators'
gem 'sass'

group :development, :test do
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
