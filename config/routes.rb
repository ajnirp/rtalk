Rtalk::Application.routes.draw do
  get "messages/create"
  get "messages/index"

  resources :rooms
  
  get "rooms/new"
  get "rooms/create"
  get "rooms/destroy"
  get "rooms/show"
  get "rooms/join"

  match 'rooms/new_router' => 'rooms#new_router', :via => [:post]
  match 'rooms/join_router' => 'rooms#join_router', :via => [:post]

  get "pages/home"
  get "pages/help"
  get "pages/about"
  get "pages/join"

  match '/about',   :to => 'pages#about'
  match '/new', :to => 'rooms#new'
  match '/join', :to => 'pages#join'

  match '/new_router', :to => 'rooms#new_router'
  match '/join_router', :to => 'rooms#join_router'

  root :to => 'pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
