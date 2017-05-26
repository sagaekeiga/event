Rails.application.routes.draw do

  root 'pages#index'

  get 'events/manage'
  
  get 'pages/entertainment'
  get 'pages/sport'
  get 'pages/business'
  get 'pages/art'
  get 'pages/internet'
  get 'pages/political'
  get 'pages/local'
  get 'pages/fashion'
  get 'pages/other'
  
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
