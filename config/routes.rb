Testtube::Application.routes.draw do
  
  root :to => 'welcome#index'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :welcome, :only => [:index]
  resources :projects, :only => [:index, :show, :update, :destroy, :create] do
    member do
      post :save
      # post :add_user, :as => "add_user"
      # match "/remove_user/:project_user_id" => "projects#remove_user", :as => "remove_user", :via => [:delete]
      # match "/update_user/:project_user_id" => "projects#update_user", :as => "update_user", :via => [:put]
    end

    resources :project_models, :only => [:index, :show], :shallow => true
    resources :project_users, :only => [:create, :update, :destroy], :shallow => true
  
    resources :user_stories, :only => [:index, :show, :create], :shallow => true do
      member do
        post :save
      end
    end

  end

  # get "project_models/index"
  # get "project_models/show"

  # get "welcome" => "welcome#index", :as => 'welcome'


  # get "user_stories/show"
  # get "user_stories" => "user_stories#index", :as => 'user_stories'
  # post "user_stories/save"
  # get "user_stories/create"

  # get "projects" => "projects#index", :as => 'projects'
  # post "projects/save"
  # # post "projects/add_user"
  # # delete "/projects/:project_id/remove_user/:id"
  # match "/projects/:id" => "projects#show"

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
