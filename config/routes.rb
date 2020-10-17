Rails.application.routes.draw do
  root 'hackathons#index'
  get 'hackathons/search', to: 'hackathons#search'
  devise_for :users
  resources :reviews, only: [:index, :destroy]
  resources :hackathons do
    resources :reviews, except: [:index, :destroy]
  end
end
