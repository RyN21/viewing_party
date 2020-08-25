Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  namespace :user do
    get '/', to: 'dashboard#index'
    post '/', to: 'friendships#create'

    get '/movies', to: 'movies#index'
    get 'movies/:id', to: 'movies#show'

    get '/discover', to: 'discover#index'

    get '/parties/new', to: 'parties#new'
    get '/parties/:party_id', to: 'parties#show'
    post '/parties', to: 'parties#create'
    delete '/parties/:party_id', to: 'parties#destroy'
  end
end
