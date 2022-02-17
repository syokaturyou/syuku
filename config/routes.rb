Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  
 resources :users, only: [:index, :edit, :update]
 get 'users/account' => 'users#account', as: 'account'
 get 'users/profile' => 'users#profile', as: 'profile'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
resources :rooms, only: [:new, :index, :show, :create, :destroy, :update, :edit]
get 'rooms/posts' => 'users#posts', as: 'posts'

resources :reservations, only: [:new, :index, :show, :create, :destroy]
post 'reservations/confirm' => 'reservations#confirm', as: 'confirm'

end
