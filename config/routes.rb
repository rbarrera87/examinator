Rails.application.routes.draw do
  authenticated :user do
    root :to => "quizzes#index", via: :get, as: :authenticated_root
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  resources :quizzes do
    resources :questions
  end
  root 'home#index'
end
