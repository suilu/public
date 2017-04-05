Rails.application.routes.draw do
  devise_for :users
  resources :teams
  root 'teams#index'
  resources :teams do
    resources :projects
  end
end
