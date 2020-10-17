Rails.application.routes.draw do
  root 'hackathons#index'
  devise_for :users
  resources :reviews, only: :index
  resources :hackathons do
    resources :reviews, except: :index
  end
end
