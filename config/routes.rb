Rails.application.routes.draw do
 
  resources :courses
  resources :rounds
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  root to: 'application#welcome'

  devise_scope :user do
    get 'login', to:'devise/sessions#new', as:'login'
    get 'signup', to: 'devise/registrations#new', as:'signup'
  end
end
