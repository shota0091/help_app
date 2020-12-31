Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#index"
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end 
  resources :home ,only: :index
  resources :users
  resources :posts do
    resources :comments, only: :create
  end
    
end
