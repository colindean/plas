Plas::Application.routes.draw do

  resources :pcfgs

  resources :events do
    resource :address
    #resources :registrations
    match '/register' => 'registrations#register', :as => :register
    match '/register/review' => 'registrations#review', :as => :registerreview
    match '/register/pay' => 'registrations#pay', :as => :registerpay
    match '/register/paypal' => 'registrations#paypal_redirect', :as => :registerpaypal
    match '/register/confirm' => 'registrations#confirm', :as => :registerconfirm
    match '/register/return' => 'registrations#return', :as => :registerreturnpay
    match '/register/success' => 'registrations#success', :as => :registersuccess
    match '/register/error' => 'registrations#error', :as => :registererror
    match '/register/reserve' => 'registrations#reserve', :as => :registerreserve
    match '/registration/:id' => 'registrations#show'
    match '/registration/:id/edit' => 'registrations#edit'
    match '/registrations' => 'registrations#index'
    resources :tickets
  end

# http://www.engineyard.com/blog/2010/the-lowdown-on-routes-in-rails-3/
	resource :account, :controller => "users"
	
  resources :users do
    resource :address
  end

	resource :user_sessions
#	match 'users/:handle' => 'users#show'
	match '/login' => 'user_sessions#new', :as => 'login'
	match '/logout' => 'user_sessions#destroy', :as => 'logout'
  resources :permissions
  resources :user_groups
	root :to => "home#index"


  #get "home/index"

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
