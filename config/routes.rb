# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books do
    resources :readings
  end

  resources :authors, :authorships, :genres, :languages, :locations

  root to: 'books#index'

  match 'unread' => 'books#unread', :via => 'get'

  match 'lchart' => 'languages#languageschart', :via => 'get'
end
