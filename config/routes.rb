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

  get '/tasks', to: 'tasks#index'
  post '/tasks', to: 'tasks#create'
  get '/tasks/new', to: 'tasks#new'
  get '/tasks/:id', to: 'tasks#show', as: :task_show
  get '/tasks/:id/edit', to: 'tasks#edit', as: :task_edit
  patch '/tasks/:id', to: 'tasks#update', as: :task_update
  put '/tasks/:id', to: 'tasks#complete', as: :task_complete
  delete '/tasks/:id', to: 'tasks#destroy', as: :task_delete
end
