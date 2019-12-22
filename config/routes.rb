Rails.application.routes.draw do
  root 'sessions#new'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy, :show, :update, :edit]
  namespace :admin do
    resources :users
  end
  get '*anything' => 'errors#routing_error'
end
