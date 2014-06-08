DbcOverflow::Application.routes.draw do
  resources :users
  resources :questions do
    resources :answers, only: [:new, :create, :edit, :update, :destroy] do
      member do
        get 'new_comment'
        post 'create_comment'
        post 'vote'
      end
    end
    member do
      get 'new_comment'
      post 'create_comment'
      post 'vote'
    end
  end
  root to: 'questions#index'
end
