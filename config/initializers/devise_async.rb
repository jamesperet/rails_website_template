# config/initializers/devise_async.rb
Devise::Async.setup do |config|
  config.enabled = true
  config.backend = :resque
  config.queue   = :send_reset_password
end