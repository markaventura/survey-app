Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      namespace :admins do
        resources :sessions, only: %w(create destroy)
        resources :surveys, only: %w(create show)
        resources :questions, only: %w(create)
      end

      resources :responses, only: %w(create)
    end
  end

end
