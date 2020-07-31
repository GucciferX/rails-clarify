Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  # No Login User Access
  root to: 'pages#home'
  get '/contact', to: 'pages#contact'

  # Logged in Users
  resources :users, only: [:show] do
    resources :patient_records, only: [:show, :new, :create, :edit, :update]
    resources :coach_records, only: [:show, :new, :create, :edit, :update]

    resources :consultations, shallow: true do
      resources :reviews, only: [:new, :create, :edit, :update]
      resources :consultation_notes, only: [:new, :create, :edit, :update]
    end

    member do
      get 'dashboard'
    end
  end
  # Plans for users
  resources :plans, only: [:index, :show]
end
