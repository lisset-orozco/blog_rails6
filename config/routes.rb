Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'articles/new', to: 'articles#new', as: :new_article
  get 'articles/:id', to: 'articles#show'
  get 'articles/:id/edit', to: 'articles#edit'
  get 'articles', to: 'articles#index'

  post 'articles', to: 'articles#create'
  patch 'articles/:id', to: 'articles#update', as: :article
  delete 'articles/:id', to: 'articles#destroy'
  # resources :articles
end
