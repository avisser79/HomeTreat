Rails.application.routes.draw do
  get 'treatments/resources'

  get 'clients/resources'

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

# no namespacing?
  resource :profile, except: [:destroy] do
    resources :appointments, only: [:index]
  end
  resources :specialists, except: [:destroy] do
    resources :treatments, shallow: true, except: [:index, :show]
    resources :appointments, only: [:new, :create]
  end
  resources :appointments, except: [:new, :create]

  get 'appointments/appointment/confirm', to: 'pages#confirm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
