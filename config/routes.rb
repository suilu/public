Rails.application.routes.draw do
  devise_for :users

  resources :projects

  resources :teams do
    resources :projects
  end
  root 'teams#index'
end
