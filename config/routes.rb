DbcOverflow::Application.routes.draw do
  resources :users, :questions, :answers, :comments
end
