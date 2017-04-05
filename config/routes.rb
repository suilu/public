Rails.application.routes.draw do
  resources :teams
  root 'teams#index'
  resources :teams do
    resources :projects
  end
end
