Rails.application.routes.draw do

  root 'user#index'

  resources :user

  resources :login do
    post :login
  end

  resources :articles do
    resources :comments
  end

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
