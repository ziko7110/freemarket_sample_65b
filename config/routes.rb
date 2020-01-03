Rails.application.routes.draw do
  get 'products/index'
  get 'products/pay'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'users#check_user'
 get 'address_new', to: 'users#address_new'
 get 'user_done', to: 'users#user_done'
 get 'call_new', to: 'users#call_new'
 get 'confirmation', to: 'users#confirmation'
 get 'sign_out', to: 'users#sign_out'
 get 'check-user', to: 'users#check_user'
 resources :tweets, only: [:new, :show, :update] 
 resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
 resources :users, only: [:edit, :update, :index, :show, :new, :destroy]
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end