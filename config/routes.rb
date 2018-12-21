Rails.application.routes.draw do



  resources :open_closes
  resources :days 

  resources :reservations do
      member do
        get 'book_lesson'
        get 'book_practice'
        get 'cancel'
      end
    end
  
  




  get 'calendar/index'

  resources :activities
  resources :timeslots
  resources :memberships
  resources :age_groups
  #resources :members
  devise_for :members
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "days#index"


end
