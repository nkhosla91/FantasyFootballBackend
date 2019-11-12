Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do 
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :teams, only: [:index, :show, :create, :update, :destroy]
      resources :players, only: [:index, :show]
    end
  end
end
