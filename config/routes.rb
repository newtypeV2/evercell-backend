Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#new'
  get '/characters/:id', to: 'characters#show'
  get '/games', to: 'games#index'
  get '/games/:id', to: 'games#show'
end
