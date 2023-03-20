Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/categories', to: 'categories#index'
  get '/categories/new', to: 'categories#new'
  post '/categories', to: 'categories#create'
  get '/categories/:id', to: 'categories#show', as: :category_show
  get '/categories/:id/edit', to: 'categories#edit', as: :category_edit
  patch '/categories/:id', to: 'categories#update', as: :category_update
  delete '/categories/:id', to: 'categories#destroy', as: :category_delete
end
