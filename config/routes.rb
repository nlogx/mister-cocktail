Rails.application.routes.draw do
  get 'users/dashboard'
  devise_for :users
  root to: 'cocktails#index'
  resources :cocktails, except: :index do
    resources :doses, only: %i[new create destroy]
  end

  resources :ingredients
end
