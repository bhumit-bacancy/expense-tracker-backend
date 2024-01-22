Rails.application.routes.draw do 
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post '/login', to: 'auth#login'
      resources :expenses
      resources :categories do
        collection do
          get :sync_data
        end
      end
    end
  end

end
