require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module FreshWriting
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    additional_autoload_directories = [
      Rails.root.join('lib'),
      Rails.root.join('app', 'factory_models'),
      Rails.root.join('app', 'forms'),
      Rails.root.join('app', 'query'),
      Rails.root.join('app', 'service'),
      Rails.root.join('app', 'view_models'),
      Rails.root.join('app', 'policy')
    ]
    additional_autoload_directories.each do |directory|
      config.autoload_paths += Dir[directory]
      config.autoload_paths += Dir[File.join(directory, '{**}')].find_all { |f| File.stat(f).directory? }
    end

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.enforce_available_locales = true
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Precompile additional assets.
    # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
    # config.assets.precompile += %w( search.js )
    config.assets.precompile += %w( admin.js admin.css print.css )
  end
end
