host = (Rails.env == 'production') ? ENV['REDIS_HOST'] : 'localhost'

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{host}:6379/12" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{host}:6379/12" }
end