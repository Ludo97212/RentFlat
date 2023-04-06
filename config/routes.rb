Rails.application.routes.draw do
  root to: 'flats#homepage'

  devise_for :users

  resources :flats do
    resources :bookings, only: [:new, :create]
    resources :comments, only: [:new, :create, :update]
  end
  resources :bookings, except: [:new, :create]
  resources :comments, except: [:new, :create, :update]

  # ----------------------------- ADDITONNAL ROUTES ----------------------------------#

  # FLATS CONTROLLER
  get "my_flats", to: "flats#my_flats"
  # BOOKINGS CONTROLLER
  get "my_bookings", to: "bookings#my_bookings"
  get "my_demands", to: "bookings#my_demands"
  get "show_demand", to: "bookings#show_demand"
  # BOOKINGS CONTROLLER
  get "contact", to: "pages#contact"
  get "infos", to: "pages#infos"

  # ----------------------------------------------- #
end
