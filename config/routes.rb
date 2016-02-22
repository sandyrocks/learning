Rails.application.routes.draw do
  devise_for :users

  namespace :users do
    resources :contacts do
    end
    get 'dashboard/index'
  end
  root 'home#index'
end
