Rails.application.routes.draw do
  resources :profiles
  resources :comments
  # resources :posts
  devise_for :users
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"
  resources :posts do
    member do
      post 'like'
    end
  end
  # resources :users do
  #   resources :posts do
  #     resources :comments
  #   end
  # end
  resource :profile, only: [:show, :edit, :update]

  # config/routes.rb
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  devise_scope :admin do
    get '/admin', to: 'admins/sessions#new'
  end

  namespace :admins do
    resources :dashboards do
      get :index, on: :collection
    end
  end

end
