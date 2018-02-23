require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tutor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.assets.precompile +=  %w( exam_form_script.js )
    config.assets.precompile +=  %w( exam_form_style.css )
    config.assets.precompile +=  %w( login_form_style.css )
    config.assets.precompile +=  %w( signup_form_style.css )
    config.assets.precompile +=  %w( main_layout_style.css )
    config.assets.precompile +=  %w( new_exam_style.css )
    config.assets.precompile +=  %w( exam_edit_style.css )
    config.assets.precompile +=  %w( exam_sheet_style.css )
    config.assets.precompile +=  %w( message_style.css )
    config.assets.precompile +=  %w( password_reset_style.css )
    config.assets.precompile +=  %w( counter_script.js )
    config.assets.precompile +=  %w( home_page_style.css )
    config.assets.precompile +=  %w( exams_show_style.css )

    config.load_defaults 5.1

    config.action_mailer.default_url_options =  {:host => '127.0.0.1', :port => 3000}
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587 ,
      user_name: Rails.application.secrets.user_name,
      password: Rails.application.secrets.password,
      authentication: 'plain',
      enable_starttls_auto: true
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
