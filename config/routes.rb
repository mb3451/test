Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # resources :projects
  # resources :features
  resources :projects do
  resources :features, only: [:index, :new,  :edit,:update,:create,  :destroy]
end
resources :features, only: [:show]

  # resources :descriptions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#home'
get 'welcome/about', to: 'welcome#about'
end
