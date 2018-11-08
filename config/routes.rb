Rails.application.routes.draw do
  resources :playbacks

  root to: 'playbacks#index'
end
