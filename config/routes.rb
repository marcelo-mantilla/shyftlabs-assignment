Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: [:index]
  resources :students, only: [:new, :create]
  resources :courses, only: [:index, :new, :create]
  resources :grades, only: [:index, :new, :create]
end
