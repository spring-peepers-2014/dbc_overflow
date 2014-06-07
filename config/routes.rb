DbcOverflow::Application.routes.draw do
  resources :users

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
