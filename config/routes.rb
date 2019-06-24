Rails.application.routes.draw do
  resources :comments
  root to: 'posts#index'
  resources :posts
  devise_for :users
  post 'posts/:id/add_tag' => 'posts#add_tag'
  get 'users/:id' => 'users#show', as: 'userid'
  put 'posts/upvote/:id' => 'posts#upvote', as: 'upvote'
  put 'posts/downvote/:id' => 'posts#downvote', as: 'downvote'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
