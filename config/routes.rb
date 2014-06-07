DbcOverflow::Application.routes.draw do
  resources :users, :questions, :answers, :comments
  root to: 'questions#index'
end
