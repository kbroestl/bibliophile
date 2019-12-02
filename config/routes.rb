# frozen_string_literal: true

RailsPortal::Application.routes.draw do
  resources :books do
    resources :readings
  end
  resources :authors
  resources :locations
  resources :genres
  resources :authorships
  resources :languages

  root to: 'books#index'

  match 'unread' => 'books#unread', :via => 'get'

  match 'lchart' => 'languages#languageschart', :via => 'get'
end
