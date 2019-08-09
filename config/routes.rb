Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#new'
  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'
  
  get '/characters/:id', to: 'characters#show'
  patch '/charactergames/:id', to: 'character_games#update'

  mount ActionCable.server => '/cable'
  
end
