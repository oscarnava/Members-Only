Rails.application.routes.draw do

  resources :posts, only: %i[new index create]

  root 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
