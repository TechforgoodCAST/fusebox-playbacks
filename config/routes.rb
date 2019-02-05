Rails.application.routes.draw do
  devise_for :users

  resources :playbacks

  get '/support/:commentable_id/comments', to: 'comments#new', as: 'new_comment'
  post '/support/:commentable_id/comments', to: 'comments#create'

  post '/webhook/new-response/:id', to: 'webhook#new_response', as: 'webhooks_new_response'

  root to: 'playbacks#index'
end
