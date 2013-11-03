ActingSisters::Application.routes.draw do
  root 'main#index'
  get "main/index"
  
  
  #Schauspieler
  get "actors/index", as: :actors
  get "actors" => 'actors#index'
  
  get "actor/:id" => 'actors#show', as: :actor_show
  get "actors/show"
  
  post 'actors/import' => 'actors#import'
  
  #Rollen
  get "roles/index", as: :roles
  get "roles" => 'roles#index'
  
  get "role/:id" => 'roles#show', as: :role_show
  get "roles/show"
  
  post 'roles/import' => 'roles#import'
  
  
  
  #Szenen
  get "scenes/index", as: :scenes
  get "scenes" => 'scenes#index'
    
  get "scene/:id" => 'scenes#show', as: :scene_show
  get "scenes/show"
  
  put "scenes/:id" => 'scenes#update', as: :scene_update
  
  post 'scenes/import' => 'scenes#import'
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
