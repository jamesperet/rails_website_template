RailsWebsiteTemplate::Application.routes.draw do
  
  resources :uploads

  get "admin/dashboard" => "admin_panel#dashboard", :as => :admin_dashboard
  get "admin" => "admin_panel#index"
  get "admin/posts" => "admin_panel#posts", :as => :admin_posts
  get "admin/users" => "admin_panel#users", :as => :admin_users
  get "admin/config" => "admin_panel#site_config", :as => :admin_config
  post "admin/config/update" => "admin_panel#site_config_update", :as => :config_update
  
  post "upload" => "uploads#upload", :as => :post_upload
  get "blog" => "blog_posts#index", :as => :blog
  get "post/:id" => "blog_posts#show", :as => :post
  resources :blog_posts, path: '/admin/posts'
  
  get '/admin/files' => "admin_panel#files", :as => :admin_files
  resources :uploads, path: '/admin/files'

  get "start/index"
  devise_for :users, :skip => [:sessions, :passwords, :confirmations, :registrations]
  as :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
    get   'signup' => 'devise/registrations#new',    :as => :new_user_registration
    post  'signup' => 'devise/registrations#create', :as => :user_registration
    put  'signup' => 'users/registrations#update', :as => :user_registration_update
    scope '/account' do
        # password reset
        get   '/reset-password'        => 'devise/passwords#new',    as: 'new_user_password'
        put   '/reset-password'        => 'devise/passwords#update', as: 'user_password'
        post  '/reset-password'        => 'devise/passwords#create'
        get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_user_password'
        # confirmation
        get   '/confirm'        => 'devise/confirmations#show',   as: 'user_confirmation'
        post  '/confirm'        => 'devise/confirmations#create'
        get   '/confirm/resend' => 'devise/confirmations#new',    as: 'new_user_confirmation'
        # settings & cancellation
        get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_user_registration'
        get '/settings' => 'devise/registrations#edit',   as: 'edit_user_registration'
        put '/settings' => 'users/registrations#update', as: 'update_user_registration'
        # account deletion
        delete '' => 'devise/registrations#destroy'
    end
  end
  
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
  root 'start#index'
end
