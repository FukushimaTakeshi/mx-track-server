FirebaseIdToken.configure do |config|
  config.redis = Redis.new
  config.project_ids = ['dirt-awesome']
end