Rails.application.routes.draw do
  root 'hackathons#index'
  get 'hackathons/search', to: 'hackathons#search'
  get 'cheer', to: 'hackathons#cheer'
  devise_for :users
  resources :reviews, only: [:index, :destroy]
  resources :hackathons do
    resources :reviews, except: [:index, :destroy]
    get 'review/:id/like', to: 'reviews#like'
  end
end
