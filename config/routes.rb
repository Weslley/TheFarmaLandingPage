Rails.application.routes.draw do
  get '/politica_de_privacidade' => 'home#privacy_policy'
  get '/home' => 'home#index'
  post '/home' => 'home#create'
  post '/home/create' => 'home#create'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
