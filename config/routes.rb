Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/user', to: 'users#create'

  resources :colleges, only: [:create, :show, :update, :destroy]
  resources :exams, only: [:create, :show, :update, :destroy]
  resources :exam_windows, only: [:create, :show, :update, :destroy]


end

