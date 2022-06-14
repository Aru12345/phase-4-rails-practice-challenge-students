Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :instructors,  only: [:index,:destroy,:create,:update]
  resources :students, only: [:index,:destroy,:create,:update]
end
