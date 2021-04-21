Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#index"
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end 
  resources :homes ,only: [:new,:index,:create] do
    collection do
      get 'inquiry'
      get 'policy'
    end
  end
  
  resources :users do
    resources :likes ,only: [:create, :destroy] do
      member do
        get 'follows'
        get 'followers'
      end
    end
    member do
      get 'recruitment_index'
    end
    resources :reviews, only: :create 
  end
  resources :notifications, only: :index
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  resources :tags, only: :show
  resources :posts do
    resources :comments, only: [:create,:destroy]
  end
    
end
