Rails.application.routes.draw do
  devise_for :users, controllers => {:registrations => "registrations"} 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :groups, only: [:index, :new, :create, :destroy] do
    resources :entities, only: [:index, :destroy]
  end
  
  resources :entities, only: [:new, :create]
end

# Rails.application.routes.draw do
#   devise_for :users, controllers: {
#     registrations: 'devise/registrations',
#     confirmations: 'devise/confirmations'
#   }
# end