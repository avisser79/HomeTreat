Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: { registrations: "registrations" }

  resource :profile, except: [:destroy] do
    resources :appointments, only: [:index]
    resources :treatments, only: [:new, :create]
    resources :agenda, shallow: true, except: [:destroy, :show]
  end

  resources :specialists, except: [:destroy] do
    resources :treatments, shallow: true, except: [:index, :show, :new, :create]
    resources :appointments, only: [:new, :create]
  end
  resources :appointments, except: [:new, :create]

  get 'appointments/confirm', to: 'pages#confirm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
