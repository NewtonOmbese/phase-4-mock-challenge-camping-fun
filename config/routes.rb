Rails.application.routes.draw do
  resources :activities, only: [:index, :destroy]
  resources :campers, only: [:index, :show, :create]
  resources :signups, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
