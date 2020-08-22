Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  namespace :user do
    get '/', to: 'dashboard#index'
    get '/discover', to: 'discover#index'
    get '/search/top_rated', to: 'discover#top_rated'
    get '/search/movie', to: 'discover#movie_search'
    get '/movies', to: 'movies#index'
    get 'movies/:id', to: 'movies#show'
    get '/discover/top_rated', to: 'discover#top_rated'
  end
end
