Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :goals, only: [:new]
  end
  resources :goals, except: [:new, :index]
  
  resource :session, only: [:new, :create, :destroy]
end
