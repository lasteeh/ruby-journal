Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  get '/app', to: 'pages#app'

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
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show', as: :user_show
  patch '/profile/edit', to: 'users#edit', as: :user_edit
  delete '/profile', to: 'users#destroy', as: :user_delete

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
