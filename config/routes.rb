Rails.application.routes.draw do
  get 'entities/index'
  get 'entities/new'
  get 'entities/create'
  get 'groups/index'
  get 'groups/new'
  get 'groups/create'
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
