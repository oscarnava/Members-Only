Rails.application.routes.draw do

  root 'posts#index'
  resources :posts, only: %i[new index create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
