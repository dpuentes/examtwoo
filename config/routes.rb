Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  get "announcements/user/:user_id", to: "announcements#author"

  get "users/new", to: "users#new"
  post "users", to:"users#create"



  get "announcements", to:"announcements#index"
  get "announcements/new", to: "announcements#new"
  get "announcements/:id", to: "announcements#show"
  get "announcements/:id/edit", to: "announcements#edit"
  patch "/announcements/:id", to: "announcements#update", as: :announcement
  post "announcements", to: "announcements#create"
  delete "announcements/:id", to: "announcements#destroy"
end
