Rails.application.routes.draw do

  get 'favorites/index'

  get 'favorites/new'

  get 'favorites/create'

  get 'favorites/update'

  get 'favorites/edit'

  get 'favorites/destroy'

  root to: 'pages#home'

  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }

  resource :profile, except: [:destroy] do
    resources :appointments, only: [:index]
    resources :treatments, only: [:new, :create]
    resources :agenda, shallow: true, except: [:destroy]
  end

  resources :specialists, except: [:destroy] do
    resources :treatments, shallow: true, except: [:index, :show, :new, :create]
    resources :appointments, only: [:new, :create]
  end
  get 'appointments/confirm', to: 'pages#confirm'
  resources :appointments, except: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
