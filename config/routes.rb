Rails.application.routes.draw do
  get 'home/top'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'home#top'
  resources :posts
  resources :users
  post 'likes/:post_id/create', to: 'likes#create'
  delete 'likes/:post_id/destory', to: 'likes#destory'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
