Rails.application.routes.draw do
  get 'courses/played', to: 'courses#played'
  resources :courses
  resources :types, only: [:index, :show] do
    resources :courses, only: [:index, :show, :new]
  end
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  root to: 'application#welcome'

  devise_scope :user do
    get 'login', to:'devise/sessions#new', as:'login'
    get 'signup', to: 'devise/registrations#new', as:'signup'
  end
end
