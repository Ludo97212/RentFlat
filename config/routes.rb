Rails.application.routes.draw do
  root to: 'flats#homepage'

  devise_for :users

  resources :flats do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]

  # ----------------------------- ADDITONNAL ROUTES ----------------------------------#

  # FLATS CONTROLLER
  get "my_flats", to: "flats#my_flats"
  # BOOKINGS CONTROLLER
  get "my_bookings", to: "bookings#my_bookings"
  get "my_demands", to: "bookings#my_demands"
  get "show_demand", to: "bookings#show_demand"

  # ----------------------------------------------- #
end
