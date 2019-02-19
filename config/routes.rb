Rails.application.routes.draw do
  devise_for :users

  resources :playbacks

  get '/pending/playbacks/(:count)', to: 'playbacks#pending', as: 'pending_playbacks'

  get '/support/:commentable_id/comments', to: 'comments#new', as: 'new_comment'
  post '/support/:commentable_id/comments', to: 'comments#create'

  post '/webhook/new-response/:id', to: 'webhook#new_response', as: 'webhooks_new_response'

  get '/support/:commentable_id/comments/:comment/:help', to: 'comments#set_helpful', as: 'set_helpful'

  root to: 'playbacks#index'
end
