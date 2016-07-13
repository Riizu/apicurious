Rails.application.routes.draw do
  root 'home#index'

  resources :summaries, only: [:index]

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
