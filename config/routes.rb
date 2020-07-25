Rails.application.routes.draw do
  get 'users/show'
  get 'users/coaches'
  get 'users/patients'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  # No Login required pages
  root to: 'pages#home'
  get '/contact', to: 'pages#contact'

  # Login required pages
  resources :users, only: [:show] do
    collection do
      get :coaches
      get :patients
    end
    resources :patient_records, only: [:new, :create, :edit, :update]
    resources :coach_records, only: [:new, :create, :edit, :update]
  end
end
