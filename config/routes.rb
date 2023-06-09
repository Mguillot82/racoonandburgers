Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, except: [:index] do
    resources :reservations, only: %i[create show destroy]
  end
  resources :racoons, except: %i[index new edit update] do
    resources :reviews, only: %i[index new create edit update destroy]
    resources :services, only: %i[new create edit update]
    resources :disponibilities, only: %i[new create update destroy]
  end
  resources :services, only: %i[destroy]

  # Defines the root path route ("/")
  # root "articles#index"
  get "/style", to: 'pages#style'
  get "/legal", to: 'pages#legal'
  get "/about", to: 'pages#about'
  get "/users/:id/dashboard", to: 'users#dashboard', as: :user_dashboard
  patch "/reservation/:id/accept", to: 'reservations#accept', as: :reservation_accept
  patch "/reservation/:id/refuse", to: 'reservations#refuse', as: :reservation_refuse
end
