Rails.application.routes.draw do
  get "posts/index"
  get "posts/show"
  get "posts/new"
  get "posts/create"
  root "posts#index"
  resources :posts do
    resources :comments
    member do
      get 'preview'
    end
    collection do
      get 'search'
    end
  end
end
