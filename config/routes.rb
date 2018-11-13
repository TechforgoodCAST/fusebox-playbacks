Rails.application.routes.draw do
  devise_for :users

  resources :playbacks
  resources :steps, only: [] do
    resources :comments, only: %i[new create]
  end
  get '/steps/:step_id/comments', to: 'comments#new'

  root to: 'playbacks#index'
end
