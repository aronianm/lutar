require 'sidekiq/web'

Rails.application.routes.draw do
  resources :exercises
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

    resources :workouts, only: [:index] do 
      get :new_workout, on: :collection
    end


    # trainor routes
    namespace :trainors do 
      authenticate :trainor do
        resources :trainors do 
          member do 
            resources :request_trainors, only: [:index]
            resources :workouts
          end
        end
      end
    end

    # user routes 
    namespace :user do 
      authenticate :user do
        resources :users, only: [:index] do 
          resources :trainors, only: [:index, :show]
            member do
              resources :request_trainors
            end
        end
      end
    end
    # devise for users and trainors 
    devise_for :users
    devise_for :trainors, path: 's', controllers: { sessions: "trainors/sessions", registrations: "trainors/registrations"}

    resources :home, only: [:index] do
      collection do 
        get :features
        get :contact
        get :company
        get :trainors
      end
    end

    root to: 'home#index'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
end
