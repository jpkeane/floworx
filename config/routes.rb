Rails.application.routes.draw do
  get 'dashboard', to: 'dashboards#index'

  resources :teams, only: %i[index show]
  resources :staff, only: %i[index show]
  resources :clients, only: %i[index show]
  resources :grades, only: %i[index show]
  root 'front_pages#home'
end
