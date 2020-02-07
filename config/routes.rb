Rails.application.routes.draw do
  devise_for :clients
  devise_for :admins

  root to: 'home#index'
  resources :carriers, only: %i[index show new create]
end
