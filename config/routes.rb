Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :todos
  end
  resources :teams do
    resources :projects do
      resources :todos
    end
  end
  root 'teams#index'
end
