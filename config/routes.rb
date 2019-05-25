Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'articles/new', to: 'articles#new'
  post 'articles', to: 'articles#create'
  get 'articles/:id', to: 'articles#show'
  get 'articles/:id/edit', to: 'articles#edit'
  get 'articles', to: 'articles#index'
  patch 'articles/:id', to: 'articles#update', as: :article
  # resources :articles
end
