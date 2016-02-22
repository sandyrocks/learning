Rails.application.routes.draw do
  devise_for :users

  namespace :users do
    get 'dashboard/index'
  end

  root 'home#index'
end
