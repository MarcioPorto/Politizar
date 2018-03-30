Rails.application.routes.draw do
  resources :countries
  resources :subscribers
  resources :regions

  post 'subscriptions/new', to: 'home#create_subscription'

  root 'home#index'

  mount RailsEmailPreview::Engine, at: 'emails'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
