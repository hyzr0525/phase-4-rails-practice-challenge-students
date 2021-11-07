Rails.application.routes.draw do
  
  resources :students, only: [:index, :show, :create, :destroy, :update]
  resources :instructors, only: [:index, :show, :create, :destroy, :update]
end
