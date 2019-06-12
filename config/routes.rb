Rails.application.routes.draw do
  resources :comments
  root to: 'posts#index'
  resources :posts
  devise_for :users
  get 'users/:id' => 'users#show', as: 'userid'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
