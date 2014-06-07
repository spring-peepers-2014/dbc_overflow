DbcOverflow::Application.routes.draw do
  resources :users

  resources :questions do
    resources :comments, only: [:new, :create, :edit, :update, :delete]
    resources :votes, only: [:create, :edit, :update]

    resources :answers, only: [:new, :create, :edit, :update, :delete] do
      resources :comments, only: [:new, :create, :edit, :update, :delete]
      resources :votes, only: [:create, :edit, :update]
    end
  end
  root to: 'questions#index'
end
