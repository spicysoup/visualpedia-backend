Rails.application.routes.draw do
  resources :users
  get '/quiz/:count' => 'quiz#new'
  post 'authenticate', to: 'authentication#authenticate'
  mount ActionCable.server => '/cable'
end