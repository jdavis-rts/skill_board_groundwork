Rails.application.routes.draw do
  resources :categories
  resources :users do
    resources :user_skills, path: 'skills'
  end
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
