require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BiddrApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_coookie_name', expire_after: 30.days

    # Tell Rails to never generate helper and asset files when controllers
    # are created by default.
    config.generators do |g|
      g.helper = false
      g.assets = false
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins("localhost:5000", "127.0.0.1:5000", "127.0.0.1", "localhost:8081")
        # allow access to only paths that begin with /api/
        resource '/api/*',
        # this allows all HTTP headers to be sent
        headers: :any,
        # Allows sharing of cookies for CORS requests made to this resource
        credentials: true,
        # define the HTTP verbs which are allowed in a request
        methods: [:get, :post, :delete, :patch, :put, :options]
      end
    end
  end
end
