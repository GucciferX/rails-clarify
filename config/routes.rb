Rails.application.routes.draw do
  get 'coach_records/new'
  get 'coach_records/edit'
  get 'patient_records/new'
  get 'patient_records/edit'
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
  # Plans for users
    resources :plans, only: [:index, :show]
end

