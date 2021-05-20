Rails.application.routes.draw do
  resources :articles do
    resources :comments, except: :index
  end
  get '/comments', to: 'comments#index', as: :comments
  resources :users do
    post 'login', on: :collection
  end
end
