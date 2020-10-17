Rails.application.routes.draw do
  root 'hackathons#index'
  devise_for :users
  resources :hackathons do
    resources :reviews
  end
end
