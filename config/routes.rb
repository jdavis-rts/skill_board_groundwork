Rails.application.routes.draw do
  resources :categories, only: [ :index, :show ]
  resources :users do
    resources :user_skills, path: 'skills'
  end
  resources :skills, only: [ :index, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
