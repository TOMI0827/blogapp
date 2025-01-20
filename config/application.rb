require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    Bundler.require(*Rails.groups)
    Dotenv::Railtie.load

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :ja

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.logger = ActiveSupport::Logger.new(STDOUT)
    config.logger.formatter = proc do |severity, time, progname, msg|
      "#{time.in_time_zone('Tokyo').strftime('%Y-%m-%d %H:%M:%S')} #{severity}: #{msg}\n"
    end
  end
end
