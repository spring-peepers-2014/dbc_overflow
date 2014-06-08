DbcOverflow::Application.routes.draw do
  resources :users

  get 'login' => 'users#login', :as => 'user_login'
  post 'login' => 'users#verify', :as => 'user_verify'
  get 'logout' => 'users#logout', :as => 'user_logout'

  resources :questions do
    member do
      post 'comment'
      post 'post'
  resources :questions do
    resources :answers, only: [:new, :create, :edit, :update, :destroy] do
      member do
        post 'add_comment'
        post 'vote'
      end
    end
    member do
      post 'add_comment'
      post 'vote'
    end
  end
  root to: 'questions#index'
end
