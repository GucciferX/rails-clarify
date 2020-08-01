Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }


  # No Login User Access
  root to: 'pages#home'
  get '/contact', to: 'pages#contact'
  get '/dashboard', to: 'users#dashboard', as: 'dashboard'

  # Logged in Users
  resources :users, only: [:show] do
    resources :patient_records, shallow: true
    resources :coach_records, shallow: true

    resources :consultations, shallow: true do
      resources :reviews, only: [:new, :create, :edit, :update]
      resources :consultation_notes, only: [:new, :create, :edit, :update]
    end
  end
  resources :plans, only: [:index, :show]
end
