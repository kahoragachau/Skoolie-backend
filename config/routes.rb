Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  post "/login", to: "sessions#create"
  post "/create/owners", to: "/login"
  delete "/logout", to: "sessions#destroy"

  resources :students
  resources :owners
  resources :classes
  resources :schools
  resources :educators
  resources :student_classrooms
  resources :student_attendances

end
