Rails.application.routes.draw do
  resources :tasks

  get 'articles/index'
  root "hello#index"
end
