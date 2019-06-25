Rails.application.routes.draw do
  concern :voteable do
    resources :votes, only: [ :create, :update, :destroy ]
  end
  resources :comments
  root to: 'posts#index'
  resources :posts, concerns: :voteable
  devise_for :users
  post 'posts/:id/add_tag' => 'posts#add_tag'
  get 'posts/:id/prev' => 'posts#prev'
  get 'posts/:id/next' => 'posts#next'
  post 'posts/filter' => 'posts#filter'
  get 'users/:id' => 'users#show', as: 'userid'
  get 'faq' => 'faq#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
