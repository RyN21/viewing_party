Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  # get 'auth/failure', to: redirect('/')

  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
