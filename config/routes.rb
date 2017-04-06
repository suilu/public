Rails.application.routes.draw do
    devise_for :users
    resources :projects do
        resources :comments
    end


    resources :teams do
        resources :projects do
            resources :comments
        end
    end
    root 'teams#index'
end
