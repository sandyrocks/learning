Rails.application.routes.draw do
  devise_for :users

  namespace :users do
    resources :contacts
    resources :groups
    get 'dashboard/index'
  end

  root 'home#index'
end
