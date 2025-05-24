Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # Define a route for the about page
  # get "about", to: "home#about"

  # # Define a route for the contact page
  # get "contact", to: "home#contact"

  # # Define a route for the blog page
  # get "blog", to: "home#blog"

  # # Define a route for the portfolio page
  # get "portfolio", to: "home#portfolio"
  devise_for :users 
  root "home#homepage"
  get 'homepage', to: 'home#homepage'
  # Define a route for the services page
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
