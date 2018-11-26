Rails.application.routes.draw do
  devise_for :users

  resources :playbacks

  get '/support/:commentable_id/comments', to: 'comments#new', as: 'new_comment'
  post '/support/:commentable_id/comments', to: 'comments#create'

  root to: 'playbacks#index'
end
