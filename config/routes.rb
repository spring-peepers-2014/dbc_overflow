DbcOverflow::Application.routes.draw do
  resources :users
  get 'login' => 'users#login', :as => 'user_login'
  post 'login' => 'users#login', :as => 'user_verify'

  resources :questions do
    resources :comments, only: [:create]
    resources :votes, only: [:create]

    resources :answers, only: [:new, :create, :edit, :update, :destroy] do
      resources :comments, only: [:create]
      resources :votes, only: [:create]
    end
  end
  root to: 'questions#index'
end
