require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'

  # Required for generating test coverage reports
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  # Trap methods to prevent model caching: https://github.com/sporkrb/spork/wiki/Spork.trap_method-Jujitsu
  require "rails/application"
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  require 'factory_bot_rails'
  Spork.trap_class_method(FactoryBot, :find_definitions)

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'webmock/rspec'
  require 'paperclip/matchers'

  # Requires supporting ruby files with custom matchers and macros, etc, in
  # spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
  # run as spec files by default. This means that files in spec/support that end
  # in _spec.rb will both be required and run as specs, causing the specs to be
  # run twice. It is recommended that you do not name files matching this glob to
  # end with _spec.rb. You can configure this pattern with with the --pattern
  # option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  # Checks for pending migrations before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Added 6/7/2019 - TH
    config.infer_spec_type_from_file_location!

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.include SolrStubs
    config.before(:each) do
      add_solr_stubs
    end

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    config.order = "random"

    # for paperclip
    config.include Paperclip::Shoulda::Matchers
    config.include Devise::TestHelpers, type: :controller
  end
end

Spork.each_run do

  # Required for generating test coverage reports
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  # This code will be run each time you run your specs.
  FactoryBot.reload
  Rails.application.reload_routes!

end
