# Be sure to restart your server when you modify this file.

RailsWebsiteTemplate::Application.config.session_store :cookie_store, key: '_rails_website_template_session', :domain => :all

# RailsWebsiteTemplate::Application.config.session_store :cookie_store, key: '_rails_website_template_session', expire_after: 7.days, domain: { test: AppConfig.host_name }.fetch(Rails.env.to_sym, :all)