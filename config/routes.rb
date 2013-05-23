Rtalk::Application.routes.draw do
  get "messages/create"
  get "messages/index"

  resources :rooms
  resources :messages
  
  get "pages/home"
  get "pages/help"
  get "pages/about"

  match '/about',   :to => 'pages#about'
  match '/new', :to => 'rooms#new'
  match '/join', :to => 'pages#join'
  match '/rooms/:id', :to => 'rooms#show'

  match '/join_router', :to => 'rooms#join_router'

  root :to => 'pages#home'
end
