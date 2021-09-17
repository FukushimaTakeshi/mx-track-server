FirebaseIdToken.configure do |config|
  config.redis = Rails.env.production? ? Redis.new(url: ENV['REDIS_URL']) : Redis.new
  config.project_ids = ['dirt-awesome']
end
