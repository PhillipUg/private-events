Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/create'
  # get 'events/show'
	root 'events#index'
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :events, only: [:index, :new, :create, :show] do
    get :join, to:'events#join', as: 'join'
  end
end
