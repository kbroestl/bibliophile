Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :readings
  end

  resources :authors, :authorships, :genres, :languages, :locations

  root to: 'books#index'

  match 'unread' => 'books#unread', :via => 'get'

  match 'lchart' => 'languages#languageschart', :via => 'get'
end
