Rails.application.routes.draw do
  get 'treatments/resources'

  get 'clients/resources'

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resource :profile, except: [:destroy]
  resources :specialists, except: [:destroy] do
    resources :treatments, shallow: true, except: [:index, :show]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
