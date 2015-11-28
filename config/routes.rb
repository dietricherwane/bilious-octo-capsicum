Rails.application.routes.draw do
  scope "(:locale)", locale: /en|fr/ do
    root "home#index"
    get '/' => 'home#index'

    devise_for :users, controllers: {
      sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords', confirmations: 'users/confirmations'
    }

    devise_scope :user do
      get "/users" => "users/registrations#new"
      get "/users/sign_up" => "users/registrations#new", as: :dashboard
      get "/administrator" => 'users/sessions#new'
    end

    get "users/administrators/list" => "users#list_administrator_accounts", as: :list_administrators
    get "users/administrators/disable/:user_id" => "users#disable_administrator_account", as: :disable_administrator_account
    get "users/administrators/enable/:user_id" => "users#enable_administrator_account", as: :enable_administrator_account
    get "users/administrators/show/:user_id" => "users#display_administrator_profile", as: :display_administrator_profile




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
    get '*rogue_url', :to => 'errors#routing'
    post '*rogue_url', :to => 'errors#routing'

  end
end
