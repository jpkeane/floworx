Rails.application.routes.draw do
  get 'dashboard', to: 'dashboards#index'

  root 'front_pages#home'
end
