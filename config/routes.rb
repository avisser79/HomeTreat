Rails.application.routes.draw do
  get 'clients/resources'

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resource :profile, except: [:destroy]
  resources :specialists, except: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
