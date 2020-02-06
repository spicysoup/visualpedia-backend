Rails.application.routes.draw do
  resources :users
  get '/quiz/:count' => 'quiz#new'
  post 'authenticate', to: 'authentication#authenticate'
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:index, :create]
  get '/indicators' => 'indicators#index'
  get '/indicators/:label' => 'indicators#show'

  mount ActionCable.server => '/cable'
<<<<<<< HEAD
=======
  
  get 'indicators' => 'indicators#index'
  get 'indicators/:label' => 'indicators#show'
>>>>>>> edfc96327b35e59603192f8b8b8babc48d24c928
end
