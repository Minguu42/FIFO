Rails.application.routes.draw do
  root 'hackathons#index'
  devise_for :users
  resources :reviews, only: [:index, :destroy]
  resources :hackathons do
    resources :reviews, except: [:index, :destroy]
  end
end
