Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Defines the root path route ("/")
  root "home#index"

  # About Page
  get "pcr/about" => "abouts#index", as: "about"

  # Contact Page
  get "pcr/contact-us" => "contacts#index", as: "contact"

  # Employees & Details Page
  resources :employees, only: %i[index show]

  # Inventory & Details Page
  resources :inventories, only: %i[index show] do
    collection do
      get "search"
    end
  end

  # Shopping Cart Routes
  resources :cart, only: %i[create destroy]
end
