Rails.application.routes.draw do
  

  
  resources :public_announcement
  resources :users_announcements
  resources :announcements

  get 'home/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  

  get "users/new", to: "users#new"
  post "users", to:"users#create"

end
