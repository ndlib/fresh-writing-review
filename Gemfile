source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', '~> 0.12.3'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'json'
gem 'bigdecimal'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'cancan'
gem 'devise', '~> 3.5.0'
gem 'omniauth-oktaoauth'
gem 'draper'
gem 'foundation-rails', '~> 5.1.1'
gem 'friendly_id', '~> 5.0.0'
gem "hesburgh_infrastructure", git: 'git@github.com:/ndlib/hesburgh_infrastructure'
gem "hesburgh_api", git: 'git@github.com:/ndlib/hesburgh_api'
# gem 'mysql2', '~> 0.3.17'
gem 'mysql2', '~> 0.4.10'
gem "rb-readline"
gem "redactor-rails"
gem "responders"
gem "carrierwave"
gem "carrierwave-mongoid", :require => "carrierwave/mongoid"
gem "mini_magick"
gem 'simple_form'
gem 'sunspot_rails'
gem 'will_paginate', '~> 3.0'

# Sprockets has an error with version 2.12 with Foundation scss
gem 'sprockets', '~> 2.11.0'

# Extended PORO functionality
gem 'virtus'

# for file uploads
gem 'paperclip', '~> 4.2.2'

# two gems for markdown editor
gem 'font-awesome-rails'
gem 'pagedown-bootstrap-rails'
gem 'redcarpet'

# for the error model
gem 'state_machine'
gem 'state_machines-activerecord'

# paper trail so we can track and fix revisions
gem 'paper_trail', '~> 3.0.1'

gem 'nokogiri', '~> 1.10.4'

# Server monitoring
gem 'newrelic_rpm'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  #gem "debugger"
  gem "rspec-rails"
  gem "capybara"
  gem "factory_bot_rails", require: false
  gem "faker"

  gem "guard"
  gem "guard-bundler"
  gem "guard-coffeescript"
  gem "guard-rails"
  gem "guard-rspec"
  gem "guard-spork", "2.1.0"
  gem "spork", "1.0.0rc4"
  gem "growl"

  gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development
end

group :test do
  gem "webmock", "~> 3.7.6"
  gem "simplecov", require: false
end
