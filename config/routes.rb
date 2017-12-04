Rails.application.routes.draw do

  resources :uploads, only: [:index, :new, :create, :destroy]

  resources :videos, only: [:index, :new, :create, :show, :destroy]
  resources :songs, only: [:index, :new, :create, :show, :destroy]
  resources :images, only: [:index, :new, :create, :show, :destroy]


  resources :widgets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'


  # get 'library' => 'library#index'
  # get 'library' => 'library#new'
  # post 'library' => 'library#create'
  # delete 'library' => 'library#delete'
  resources :library, only: [:index, :new, :create, :delete]

  get 'uploader' => 'welcome#uploader'

  get 'invite' => 'invite#add_share_by_invite'
  post 'share/enable' => 'invite#enable_invite'
  post 'share/disable' => 'invite#disable_invite'
  get 'share' => 'invite#index'
  post 'share/revoke' => 'invite#revoke_share'
  post 'share/revokeall' => 'invite#revoke_all_shares'
  post 'share/remove' => 'invite#remove_share'

  get 'signup' => 'users#new'
  post 'signup' => "users#create"
  get 'profile' => 'users#profile'
  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  get 'admin' => 'admin#index'

  delete 'library' => 'library#delete'

  match ':controller(/:action(/:id))', :via => :get
  match ':controller(/:action(/:id))', :via => :post


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
