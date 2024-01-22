# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'

    resource '/api/v1/expenses', headers: :any, methods: [:post, :get]
    resource '/api/v1/login', headers: :any, methods: [:post] 
    resource '/api/v1/categories/sync_data', headers: :any, methods: [:get] 

  end
  # allow do
  #   origins 'http://localhost:3000'

  #   resource '/api/v1/login', headers: :any, methods: [:post] 
  # end
end
