Rails.application.routes.draw do
  get 'posts/new'
  post 'posts/new', to: 'posts#create'
  get 'posts/index'
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
