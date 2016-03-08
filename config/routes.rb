Rails.application.routes.draw do

  root 'staticpages#home'
  get  'about' => 'staticpages#about'
  get 'signup' => 'users#new'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  get 'logout' => 'session#destroy'

  resources :users
  resources :events
  resources :attendances
  
end
