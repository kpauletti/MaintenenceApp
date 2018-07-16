Rails.application.routes.draw do
  resources :cars
  resources :tickets
  root 'pages#home'
end
