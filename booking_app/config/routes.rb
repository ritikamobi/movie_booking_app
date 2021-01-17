Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: "frontend#new"
  as :user do
    get '/signup' => 'devise/registrations#new'
    get '/signin' => 'devise/sessions#create'
  end

  get 'booking_layout' => 'booking#index'
  get 'screen_avl' => 'booking#screen_avl'
  get 'time_slot' => 'booking#time_slot'
  get 'seat_layout' => 'booking#seat_layout'
  post 'ticket_preview' => 'booking#ticket_preview'
  post 'confirm_booking' => 'booking#confirm_booking'
  namespace :admin do
    get 'bookings' => 'booking#index'
  end

end
