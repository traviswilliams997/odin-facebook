Rails.application.routes.draw do

  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]

  resources :posts do
    resources :comments
  end

  post 'users/:id/follow', to: 'users#follow', as: 'follow'
  post 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  post 'users/:id/accept', to: 'users#accept', as: 'accept'
  post 'users/:id/decline', to: 'users#decline', as: 'decline'
  post 'users/:id/cancel', to: 'userse#cancel', as: 'cancel'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"
end
