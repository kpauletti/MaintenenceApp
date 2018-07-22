Rails.application.routes.draw do
  resources :cars
  resources :tickets
  root 'pages#home'
  get '/todo' => 'pages#todo_index'
  get 'completed-tickets' => 'tickets#completed'
  get 'all' => 'cars#all_cars'
end
