DbcOverflow::Application.routes.draw do
  resources :users

  resources :questions do
    member do 
      post 'comment'
      post 'post'
    end
  end

  resources :answers, only: [:new, :create, :edit, :update, :destroy] do
    member do 
      post 'comment'
      post 'post'
    end
  end
  root to: 'questions#index'
end
