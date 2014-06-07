DbcOverflow::Application.routes.draw do
  resources :users
  get 'login' => 'users#login', :as => 'user_login'
  post 'login' => 'users#verify', :as => 'user_verify'
  get 'logout' => 'users#logout', :as => 'user_logout'

  resources :questions do
    resources :comments, only: [:new, :create]
    resources :votes, only: [:create]

    resources :answers, only: [:new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:new, :create]
      resources :votes, only: [:create]
    end
  end
  root to: 'questions#index'
end
