Rails.application.routes.draw do
  devise_for :users
  root 'hackathons#index'
end
