DbcOverflow::Application.routes.draw do
  resources :users, :comments
  resources :questions do
    resources :answers
  end
  root to: 'questions#index'
end
