# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'rails-ujs', '~> 0.1.0'

group :development, :test do
  gem 'pry', '~> 0.13.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'rails_best_practices', require: false
  gem 'bullet', '~> 6.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'yt', '~> 0.13.7'
gem 'bootstrap-sass', '~> 3.3.0.1'
gem 'autoprefixer-rails', '~> 9.7.6'
gem 'slim-rails', '~> 3.2.0'
gem 'figaro', '~> 1.1.1'

gem 'rails-observers', '~> 0.1.5'
gem 'devise', '~> 4.7.1'
gem 'kaminari', '~> 1.2.0'

group :test do
  gem 'simplecov', require: false
  gem 'rspec-rails', '~> 4.0.0'
  gem 'database_cleaner-active_record', '~> 1.8.0'
  gem 'capybara', '~> 3.32.1'
  gem 'selenium-webdriver', '~> 3.142.7'
  gem 'chromedriver-helper', '~> 2.1.1'
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'faker', '~> 2.11.0'
  gem 'shoulda-matchers', '~> 4.3.0'
  gem 'rails-controller-testing', '~> 1.0.4'
end
