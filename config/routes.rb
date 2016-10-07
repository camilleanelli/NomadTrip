Rails.application.routes.draw do
  root :controller => 'static', :action => '/'
  
  devise_for :users

  resources :trips, except: [:show] do
    resources :transportations do
      resources :tickets, only: [:new, :create, :destroy]
    end
    resources :accomodations
    end
    resources :import_nomad_lists
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
