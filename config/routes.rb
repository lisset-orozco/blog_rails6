Rails.application.routes.draw do
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :articles do
    # get 'articles/user/:user_id', to: 'articles#from_author'
    get 'user/:user_id', to: 'articles#from_author', on: :collection

    # collection do
    #   get 'user/:user_id', to: 'articles#from_author'
    # end
  end

  # get 'articles/new', to: 'articles#new', as: :new_article
  # get 'articles/:id', to: 'articles#show'
  # get 'articles/:id/edit', to: 'articles#edit'
  # get 'articles', to: 'articles#index'

  # post 'articles', to: 'articles#create'
  # patch 'articles/:id', to: 'articles#update', as: :article
  # delete 'articles/:id', to: 'articles#destroy'
end
