Rails.application.routes.draw do
  resources :users
  get '/quiz/:count' => 'quiz#new'
  post 'authenticate', to: 'authentication#authenticate'
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:index, :create]
  mount ActionCable.server => '/cable'
end