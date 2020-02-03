Rails.application.routes.draw do
  root :to => 'session#new'
  resources :users

  get '/quiz/:count' => 'quiz#new'

  post 'authenticate', to: 'authentication#authenticate'
end
