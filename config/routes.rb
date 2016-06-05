Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations', passwords: 'users/passwords' }
  
  devise_scope :user do
    get "/login" => "users/sessions#new"
    post "/login" => "users/sessions#create"
    get "/signup" => "users/registrations#new"
    post "/signup" => "users/registrations#create"
    delete "/logout" => "users/sessions#destroy"

    get "/users/settings/account", to: "users/registrations#edit", as: :user_settings_account
    #patch "/users/settings/account", to: "users/registrations#update"

    get "/users/settings/profile", to: "users/registrations#profile", as: :user_settings_profile
    put "/users/settings/profile", to: "users/registrations#profile_update", as: :update_user_settings_profile
    
  end

  root 'static_pages#home'

  get '/contacts', to: 'static_pages#contacts', as: "contacts"

  resources :signup_steps
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
