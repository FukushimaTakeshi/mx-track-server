Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins ENV['PRODUCTION_DOMAIN']
      resource '*',
               headers: :any,
               methods: [:get, :post, :put, :patch, :delete, :options, :head]
    else
      origins 'localhost:8000'
      resource '*',
               headers: :any,
               methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
end
