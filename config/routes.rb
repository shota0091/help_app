Rails.application.routes.draw do
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
    resources :reviews, only: :create 
  end
  resources :chat_rooms, only: [:create,:show,:index]
  resources :tags, only: :show
  resources :posts do
    resources :comments, only: [:create,:destroy]
  end
    
end
