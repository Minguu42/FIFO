Rails.application.routes.draw do
  root 'hackathons#index'
  devise_for :users
  resources :hackathons do |f|
    resources :reviews
  end
end
