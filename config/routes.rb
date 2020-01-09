Rails.application.routes.draw do
  get 'products/index'
  get 'products/pay'
  devise_for :users,
  controllers: {
    sessions: 'devise/sessions',
    registrations: "devise/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'items#index'
 get 'address_new', to: 'users#address_new'
 get 'user_done', to: 'users#user_done'
 get 'call_new', to: 'users#call_new'
 get 'card', to: 'tweets#card'
 get 'confirmation', to: 'users#confirmation'
 get 'sign_out', to: 'users#sign_out'
 get 'check_user', to: 'users#check_user'
 get 'buy_confirmation', to: 'items#buy_confirmation'
 get 'exhibiting/:id', to:'users#exhibiting'
 get 'sold/:id', to:'users#sold'
 get 'trading/:id', to:'users#trading'
resources :items, except: :show
 get 'new_user_session', to: 'sessions#new'
 devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
 resources :tweets, only: [:new, :show, :update] 
 resources :users, only: [:edit, :update, :index, :show, :new, :destroy, :create]
 resources :signup do
  collection do
    get 'new'
    get 'call_new'
    get 'address_new'
    get 'pay_jp_new'
    get 'user_done' 
  end
end
 resources :items, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end