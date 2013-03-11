ActionController::Routing::Routes.draw do |map|
  map.resources :transactions

  map.resources :accounts

  map.resources :categories

  map.resources :users

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.root :controller => "welcome"
  map.connect 'user/:id', :controller => 'user', :action => 'view'
  map.connect 'users/:id', :controller => 'user_accounts', :action => 'view'
  map.connect 'account/:id', :controller => 'account', :action => 'view'
  map.connect 'account/monthly/:id/:begin_date/:end_date', :controller => 'accounts', :action => 'show',
              :id => /\d+/,
              :begin_date => /[^\/]+/,
              :end_date => /[^\/]+/
  map.connect 'account/transactions/:id', :controller => 'account', :action => 'transactions'
  map.connect 'account/transactions/since/:date/:id',
             :controller => 'accounts',
             :action     => 'since',
             :date => /[^\/]+/,
             :id => /\d+/
  map.connect 'account/transactions/since/:date/:id.:format',
             :controller => 'accounts',
             :action     => 'since',
             :date => /[^\/]+/,
             :id => /\d+/

  map.connect 'transaction/new/:id',
             :controller => 'transactions',
             :action     => 'new',
             :id => /\d+/

  map.connect 'transaction/:id', :controller => 'transaction', :action => 'view'

  map.resources :users, :has_many => [ :accounts]
  map.resources :accounts, :has_many => [ :transactions]

  map.resources :accounts do
    map.resources :transactions
  end
end
