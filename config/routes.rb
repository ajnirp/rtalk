Rtalk::Application.routes.draw do
  get "messages/create"
  get "messages/index"

  resources :rooms
  resources :messages
  
  get "pages/home"
  get "pages/help"
  get "pages/about"

  get "rooms/:id/export_chat_logs"

  match '/about',   :to => 'pages#about'
  match '/new', :to => 'rooms#new'
  match '/join', :to => 'pages#join'
  match '/rooms/:id', :to => 'rooms#show'

  match '/join_router', :to => 'rooms#join_router'
  match '/export_logs', :to => 'rooms#export_chat_logs'

  root :to => 'pages#home'
end
