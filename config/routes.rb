Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: %i[show index] do
    resources :comments
  end

  namespace :admin do
    resources :posts
    resource :session, only: %i[new create destroy]
  end
end
