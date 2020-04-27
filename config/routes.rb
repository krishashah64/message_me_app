Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'chatroom#index'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'

  get 'logout', to: 'sessions#destroy'

  delete 'logout', to: 'sessions#destroy'

  post 'message', to: 'messages#create'

  resources :users

  mount ActionCable.server, at: '/cable'
end
