require "api_constraints"

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do

    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: { sessions: "sessions" }
    
    scope module: :v1,
                  constraints: ApiConstraints.new(version: 1) do
      resources :users
    end

    scope module: :v2,
          constraints: ApiConstraints.new(version: 2, default: true) do
      resources :users
    end
  end
end
