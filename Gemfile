source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7'
# # Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'dotenv-rails', groups: [:development, :test]
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# ez gem - https://github.com/JeffCohen/ez
# gem 'ez'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Automatically add vendor prefix
gem 'autoprefixer-rails'
# Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# Twitter
gem 'twitter'
# JQuery UI
gem 'jquery-ui-rails'
# Postgres
gem 'pg'
# Use ActiveModel has_secure_password
gem 'bcrypt'
gem 'devise'
# rails admin
gem 'rails_admin'
# validate email
gem 'email_validator'
# whenever for cron job
gem 'whenever', :require => false

gem 'bootstrap-will_paginate'

gem 'simplecov', :require => false, :group => :test

gem 'minitest', group: :test
gem 'minitest-reporters', group: :test


gem 'figaro'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'quiet_assets'

  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'puma'
  gem 'rails_12factor', '~> 0.0.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

