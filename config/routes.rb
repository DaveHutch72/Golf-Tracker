Rails.application.routes.draw do
 
  resources :courses
  resources :rounds
  devise_for :users
  root to: 'application#welcome'
end
