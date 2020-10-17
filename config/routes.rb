Rails.application.routes.draw do
  root 'hackathons#index'
  devise_for :users
  resources :hackathons, only: [:index, :show]
end
