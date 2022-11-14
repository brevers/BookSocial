# frozen_string_literal: true

Rails.application.routes.draw do
  resources :myfriends
  resources :profiles

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # This is to contact with controller called `posts_controller.rb´ and
  # in folder view/posts with `index.html.erb´
  root 'pages#index' 

  # This is to connect with the controller called pages_controller.rb and
  # with views/pages main.html.erb and friends.html.erb
  get 'main' => 'pages#main'
  get 'friends' => 'pages#friends'
  get 'contact_us' => 'pages#contact_us'
  get 'profiles' => 'profiles#show'

  # Logout delete user session
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'books/:id', to: 'books#show', as: :book

  # Search Feature in nav Bar functionality
  get 'search', to: 'books#search'
  get 'search_results', to: 'books#search_results'

  get 'google_search/:title', to: 'books#google_search', as: :google_search
  get 'google_search_results', to: 'books#google_search_results'

  # Books functionality
  post 'add_to_favorites', to: 'books#add_to_favorites'
  post 'add_to_wishlist', to: 'books#add_to_wishlist'
  post 'add_to_reads', to: 'books#add_to_reads'
  post 'import', to: 'books#import'

  post 'remove_from_favorites', to: 'books#remove_from_favorites'
  post 'remove_from_wishlist', to: 'books#remove_from_wishlist'
  post 'remove_from_reads', to: 'books#remove_from_reads'
end
