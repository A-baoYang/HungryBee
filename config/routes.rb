Rails.application.routes.draw do
  resources :orders

  get '/orders' => 'orders#index'
  get '/orders/new' => 'orders#new'
  post '/orders' => 'orders#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
