Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  namespace :user do
    get '/', to: 'dashboard#index'
    get '/discover', to: 'discover#index'
  end
end
