Rails.application.routes.draw do
  devise_for :users
  resources :cars
  resources :tickets
  root 'pages#home'
  get '/todo' => 'pages#todo_index'
  get 'completed-tickets' => 'tickets#completed'
  get 'all' => 'cars#all_cars'
  get 'calendar' => 'pages#calendar'
end
