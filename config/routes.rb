Rails.application.routes.draw do
  get 'dashboard', to: 'dashboards#index'

  resources :teams, only: %i[index show]
  root 'front_pages#home'
end
