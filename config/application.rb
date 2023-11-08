require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsPortal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # The allowed IP may change based on whether or not the development host
    # is in docker on on another linux host.
    config.web_console.permissions = %w[172.0.0.0/10]
    config.web_console.development_only = false

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Changes for rspec inclusion
    config.generators do |g|
      g.test_framework :rspec,
                        fixtures: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: true,
                        request_specs: true
       g.fixture_replacement :factory_bot, dir: 'spec/factories'
     end
  end
end
