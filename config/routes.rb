Rails.application.routes.draw do
  resources :parts
  devise_for :users, controllers: { registrations: "registrations" }
  resources :cars
  resources :tickets
  resources :events
  root 'pages#home'
  get '/todo' => 'pages#todo_index'
  get 'filter' => 'pages#filter'
  get 'completed-tickets' => 'tickets#completed'
  get 'finalize' => 'tickets#finalize_ticket'
  get 'all' => 'cars#all_cars'
  get 'calendar' => 'pages#calendar'
  get 'admin' => 'pages#admin'

end
