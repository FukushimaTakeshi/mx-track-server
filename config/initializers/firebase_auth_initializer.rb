FirebaseIdToken.configure do |config|
  config.redis = Rails.env.production? ? Redis.new(url: ENV["REDIS_URL"], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }) : Redis.new
  config.project_ids = ['dirt-awesome']
end
