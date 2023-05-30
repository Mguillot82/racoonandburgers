Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, except: [:index] do
    resources :services, only: %i[new create edit update]
    resources :disponibilities, only: %i[new create destroy]
    resources :reviews, only: %i[index new create edit update destroy]
    resources :reservations, only: %i[new create destroy]
  end
  resources :services, only: %i[destroy]

  # Defines the root path route ("/")
  # root "articles#index"
  get "/style", to: 'pages#style'
  get "/legal", to: 'pages#legal'
  get "/about", to: 'pages#about'
end
