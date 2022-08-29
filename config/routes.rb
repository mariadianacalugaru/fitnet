Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'users/registrations' }
  root 'home#index'
  get 'home/index'

  resources :users
  resources :reviews, only: [:index, :new, :create]
  resources :messages, only: [:index, :new, :create,:destroy]
  resources :schedules, only: [:index, :new, :create]
  resources :schedule_exercises, only: [:show]
  resources :requests, only: [:index, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
