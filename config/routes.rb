Rails.application.routes.draw do
  resources :categories
  resources :users
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
