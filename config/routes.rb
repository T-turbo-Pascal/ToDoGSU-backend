Rails.application.routes.draw do
  post 'signup', to: 'users#create'
  post 'login', to: 'users#login'
  get 'tasks', to: 'task#get_tasks'
end
