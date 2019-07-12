Rails.application.routes.draw do
  resources :comments
  root to: 'posts#index'
  resources :posts
  devise_for :users
  post 'posts/:id/add_tag' => 'posts#add_tag'
  get 'posts/:id/prev' => 'posts#prev'
  get 'posts/:id/next' => 'posts#next'
  post 'posts/filter' => 'posts#filter'
  get 'users/:id' => 'users#show', as: 'userid'
  get 'faq' => 'faq#index'
  post 'posts/:id/vote' => 'votes#post_vote'
  post 'comments/:id/vote' => 'votes#comment_vote'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
