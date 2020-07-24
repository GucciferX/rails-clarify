Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  # No Login required pages
  root to: 'pages#home'
  get '/contact', to: 'pages#contact'

  # resources :users, only [] do
  #   resources :patient_records, only 


  #   resources :coach_records, only []
  # end
  # Login required pages
end
