Rails.application.routes.draw do
  get 'dashboard', to: 'dashboards#index'

  resources :teams, only: %i[index show]
  resources :staff, only: %i[index show]
  resources :clients
  resources :grades, only: %i[index show]
  resources :projects, only: %i[index show]
  resources :roles, only: %i[index show]
  resources :skills, only: %i[index show]
  resources :engagements, only: %i[index show]
  root 'front_pages#home'
end
