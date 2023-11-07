require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HouseBookingBackend

  class Application < Rails::Application
    config.load_defaults 7.1

    config.session_store :cookie_store, key: '_authentication_app'

    config.autoload_lib(ignore: %w(assets tasks))
  end
  # class Application < Rails::Application
  #   # Initialize configuration defaults for originally generated Rails version.
  #   config.load_defaults 7.1

  #   config.middleware.use ActionDispatch::Session::CookieStore, key: '_authentication_app'


  #   # config.session_store :cookie_store, key: '_interslice_session'
  #   # config.middleware.use ActionDispatch::Cookies
  #   # config.middleware.use config.session_store, config.session_options

  #   # Please, add to the `ignore` list any other `lib` subdirectories that do
  #   # not contain `.rb` files, or that should not be reloaded or eager loaded.
  #   # Common ones are `templates`, `generators`, or `middleware`, for example.
  #   config.autoload_lib(ignore: %w(assets tasks))

  #   # config.middleware.use ActionDispatch::cookie_store
  #   # config.middleware.use ActionDispatch::Session::CookieStore

  #   # Configuration for the application, engines, and railties goes here.
  #   #
  #   # These settings can be overridden in specific environments using the files
  #   # in config/environments, which are processed later.
  #   #
  #   # config.time_zone = "Central Time (US & Canada)"
  #   # config.eager_load_paths << Rails.root.join("extras")
  #   config.session_store :cookie_store
  # end
end
