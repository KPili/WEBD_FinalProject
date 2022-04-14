Rails.application.routes.draw do
  get "contacts/index"
  # get 'abouts/index'
  # get 'home/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  # About Page
  get "pcr/about" => "abouts#index", as: "about"

  # Contact Page
  get "pcr/contact-us" => "contacts#index", as: "contact"
end
