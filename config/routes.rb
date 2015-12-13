Rails.application.routes.draw do
  scope "(:locale)", locale: /en|fr/ do
    root "home#index"
    get '/' => 'home#index'
    get '/focus' => 'home#focus_on_woman', as: :focus_on_woman
    get '/contact' => 'home#contact', as: :contact
    get '/compendium' => 'home#compendium', as: :compendium
    get '/activités' => 'home#activities', as: :activities
    get '/galerie' => 'home#gallery', as: :gallery
    get '/blog' => 'home#blog', as: :blog
    get '/job' => 'home#job', as: :job
    get "/activités/:activity_category_id" => "home#activities_details", as: :activities_details

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

    get "set_locale/:user_locale" => "home#set_user_locale", as: :set_user_locale

    get "/administrator/manage_content_home" => "manage_front_content#home_page", as: :manage_home_front_content
    get "/administrator/manage_content_focus_on_woman" => "manage_front_content#focus_on_woman_page", as: :manage_focus_on_woman_page_front_content
    get "/administrator/manage_content_contact" => "manage_front_content#contact_page", as: :manage_contact_front_content
    get "/administrator/manage_content_compendium" => "manage_front_content#compendium_page", as: :manage_compendium_front_content
    post "/administrator/update_fr_content_home" => "manage_front_fr_content#update_home_page_content", as: :update_fr_home_front_content
    post "/administrator/update_en_content_home" => "manage_front_en_content#update_home_page_content", as: :update_en_home_front_content

    get "/administrator/activity_category" => "activity_categories#index", as: :activity_category
    post "/administrator/activity_category/create" => "activity_categories#create", as: :create_activity_category
    get "/administrator/activity_category/create" => "activity_categories#index"
    get "/administrator/activity_category/edit/:activity_category_id" => "activity_categories#edit", as: :edit_activity_category
    post "/administrator/activity_category/update" => "activity_categories#update", as: :update_activity_category
    get "/administrator/activity_categories/list" => "activity_categories#list", as: :list_activity_categories
    get "/administrator/activity_category/disable/:activity_category_id" => "activity_categories#disable_activity_category", as: :disable_activity_category
    get "/administrator/activity_category/enable/:activity_category_id" => "activity_categories#enable_activity_category", as: :enable_activity_category

    get "/administrator/activity" => "activities#index", as: :activity
    post "/administrator/activity/create" => "activities#create", as: :create_activity
    get "/administrator/activity/edit/:activity_id" => "activities#edit", as: :edit_activity
    get "/administrator/activity/image/delete/:activity_attachment_id" => "activities#delete_image", as: :delete_activity_attachment_image
    post "/administrator/activities/update" => "activities#update", as: :update_activity
    get "/administrator/activities/update" => "activities#list"
    get "/administrator/activities/list" => "activities#list", as: :list_activities
    get "/administrator/activity/disable/:activity_id" => "activities#disable_activity", as: :disable_activity
    get "/administrator/activity/enable/:activity_id" => "activities#enable_activity", as: :enable_activity

    get "/administrator/gallery_category" => "gallery_categories#index", as: :gallery_category
    post "/administrator/gallery_category/create" => "gallery_categories#create", as: :create_gallery_category
    get "/administrator/gallery_category/create" => "gallery_categories#index"
    get "/administrator/gallery_category/edit/:gallery_category_id" => "gallery_categories#edit", as: :edit_gallery_category
    get "/administrator/gallery_category/attachment/delete/:gallery_attachment_id" => "gallery_categories#delete_attachment", as: :delete_gallery_attachment
    post "/administrator/gallery_category/update" => "gallery_categories#update", as: :update_gallery_category
    get "/administrator/gallery_categories/list" => "gallery_categories#list", as: :list_gallery_categories
    get "/administrator/gallery_category/disable/:gallery_category_id" => "gallery_categories#disable_gallery_category", as: :disable_gallery_category
    get "/administrator/gallery_category/enable/:gallery_category_id" => "gallery_categories#enable_gallery_category", as: :enable_gallery_category

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
