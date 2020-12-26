Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#home" 
  resources :posts do
    collection do
      get :home
    end
  end
end
