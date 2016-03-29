Rails.application.routes.draw do
get '/didi' => 'home#didi'
  #devise_for :companies
  scope "(:locale)", locale: /en|fr/ do
    root "home#index"
    get '/' => 'home#index'
    get '/focus' => 'home#focus_on_woman', as: :focus_on_woman
    get '/contact' => 'home#contact', as: :contact
    post '/contact/submit' => 'home#submit_contact', as: :submit_contact
    get '/compendium' => 'home#compendium', as: :compendium
    get '/directory' => 'home#directory', as: :directory
    get 'compendium/responsable/1'  => 'home#responsible1', as: :responsible1
    get 'compendium/responsable/2'  => 'home#responsible2', as: :responsible2
    get '/activités' => 'home#activities', as: :activities
    get '/activités/liste/:activity_category_id' => 'home#activities_details_list', as: :activities_details_list
    get '/activité/:activity_id' => 'home#activity_details', as: :activity_details
    get '/galerie' => 'home#gallery', as: :gallery
    get '/galerie/photos/liste' => 'home#photo_gallery', as: :photo_gallery
    get '/galerie/photos/details/:gallery_category_id' => 'home#photo_gallery_details', as: :photo_gallery_details
    get '/galerie/documents/liste' => 'home#documents_gallery', as: :documents_gallery
    get '/galerie/documents/details/:gallery_category_id' => 'home#documents_gallery_details', as: :documents_gallery_details
    get '/galerie/videos/liste' => 'home#video_gallery', as: :video_gallery
    get '/galerie/videos/details/:gallery_category_id' => 'home#video_gallery_details', as: :video_gallery_details
    get '/blog' => 'home#blog', as: :blog
    get '/blog_category/:blog_category_id' => 'home#blog_category', as: :blog_category
    get '/blogger/blog_themes/:blogger_id' => 'home#blogger_posts', as: :blogger_posts
    get '/blogger/biography/:blogger_id' => 'home#blogger_biography', as: :blogger_biography
    get '/blog_theme/:blog_theme_id' => 'home#blog_theme', as: :blog_theme
    post '/blog_post/create' => 'home#create_blog_post', as: :create_blog_post
    get '/blog_post/create' => 'home#blog'
    #get '/job' => 'home#job', as: :job
    get "/activités/:activity_category_id" => "home#activities_details", as: :activities_details

    get "/job" => 'jobs#index', as: :job
    get "/job/:offer_id" => 'jobs#details', as: :job_details
    get "/jobs" => 'jobs#list_offers', as: :jobs
    post "/jobs/search" => 'jobs#search', as: :search_jobs
    get "/company/offer/new" => 'companies#new_offer', as: :new_company_offer
    post "/company/offer/create" => 'companies#create_offer', as: :create_company_offer
    get "/company/offer/create" => 'companies#new_offer'

    devise_for :users, controllers: {
      sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords', confirmations: 'users/confirmations'
    }


    devise_for :companies, controllers: {
      sessions: 'companies/sessions', registrations: 'companies/registrations', passwords: 'companies/passwords', confirmations: 'companies/confirmations'
    }

    devise_scope :company do
      get "/entreprise/inscription" => "companies/registrations#new", as: :register_company
      get "/entreprises/inscription" => "companies/registrations#new"
      get "/entreprise/connexion" => 'companies/sessions#new'
      delete "/company/sign_out" => 'companies/sessions#destroy'
      get '/company/sign_out' => 'company/sessions#destroy', as: :sign_out_company
    end

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

    post "/administrator/gallery_attachment/update" => "gallery_attachments#update", as: :update_gallery_attachment

    # Jobs
    get "administrator/jobs" => "admin_jobs#admin_list_jobs", as: :admin_list_jobs
    get "/administrator/offer/new" => "admin_jobs#admin_new_offer", as: :admin_new_offer
    post "/administrator/offer/create" => "admin_jobs#admin_create_offer", as: :admin_create_offer
    get "/administrator/offer/create" => "admin_jobs#admin_new_offer"
    get "administrator/job/:offer_id" => "admin_jobs#admin_job_details", as: :admin_job_details
    get "administrator/offer/validate/:offer_id" => "admin_jobs#admin_validate_offer", as: :admin_validate_offer
    get "administrator/offer/reject/:offer_id" => "admin_jobs#admin_reject_offer", as: :admin_reject_offer
    get "administrator/jobs/validated" => "admin_jobs#admin_list_validated_jobs", as: :admin_list_validated_jobs

    # Companies
    get "administrator/companies" => "admin_companies#companies", as: :admin_registered_companies
    get "administrator/company/registration/renew/:company_id" => "admin_companies#renew_registration", as: :admin_renew_company_registration
    get "administrator/company/registrations/:company_id" => "admin_companies#registrations", as: :admin_company_registrations

    # Bloggeurs
    get "administrator/blogger" => "admin_bloggers#blogger", as: :admin_blogger
    post "administrator/blogger/create" => "admin_bloggers#create_blogger", as: :admin_create_blogger
    get "administrator/blogger/create" => "admin_bloggers#blogger"
    get "administrator/bloggers" => "admin_bloggers#bloggers", as: :admin_bloggers
    get "administrator/blogger/enable/:blogger_id" => "admin_bloggers#enable_blogger", as: :enable_blogger
    get "administrator/blogger/disable/:blogger_id" => "admin_bloggers#disable_blogger", as: :disable_blogger
    get "administrator/blogger/edit/:blogger_id" => "admin_bloggers#edit_blogger", as: :edit_blogger
    post "administrator/blogger/update" => "admin_bloggers#update_blogger", as: :admin_update_blogger
    get "administrator/blogger/update" => "admin_bloggers#bloggers"


    # Blog categories
    get "administrator/blog/category" => "admin_blog_categories#blog_category", as: :admin_blog_category
    post "administrator/blog/category/create" => "admin_blog_categories#create_blog_category", as: :admin_create_blog_category
    get "administrator/blog/category/create" => "admin_blog_categories#blog_category"
    get "administrator/blog/category/edit/:blog_category_id" => "admin_blog_categories#edit_blog_category", as: :edit_blog_category
    post "administrator/blog/category/update" => "admin_blog_categories#update_blog_category", as: :update_blog_category
    get "administrator/blog/category/update" => "admin_blog_categories#list_blog_categories"
    get "administrator/blog/categories/list" => "admin_blog_categories#list_blog_categories", as: :admin_list_blog_categories
    get "administrator/blog/category/disable/:blog_category_id" => "admin_blog_categories#disable_blog_category", as: :disable_blog_category
    get "administrator/blog/category/enable/:blog_category_id" => "admin_blog_categories#enable_blog_category", as: :enable_blog_category

    # Blog themes
    get "administrator/blog_theme" => "admin_blog_themes#blog_theme", as: :admin_blog_theme
    post "administrator/blog_theme/create" => "admin_blog_themes#create_blog_theme", as: :admin_create_blog_theme
    get "administrator/blog_theme/create" => "admin_blog_themes#blog_theme"
    get "administrator/blog_theme/edit/:blog_theme_id" => "admin_blog_themes#edit_blog_theme", as: :edit_blog_theme
    post "administrator/blog_theme/update" => "admin_blog_themes#update_blog_theme", as: :update_blog_theme
    get "administrator/blog_theme/update" => "admin_blog_themes#list_blog_themes"
    get "administrator/blog_themes/list" => "admin_blog_themes#list_blog_themes", as: :admin_list_blog_themes
    get "administrator/blog_theme/disable/:blog_theme_id" => "admin_blog_themes#disable_blog_theme", as: :disable_blog_theme
    get "administrator/blog_theme/enable/:blog_theme_id" => "admin_blog_themes#enable_blog_theme", as: :enable_blog_theme
    get "administrator/blog_theme/comments/:blog_theme_id" => "admin_blog_themes#blog_theme_comments", as: :admin_blog_theme_comments
    get "administrator/blog_post/disable/:blog_post_id" => "admin_blog_themes#disable_blog_post", as: :disable_blog_post
    get "administrator/blog_post/enable/:blog_post_id" => "admin_blog_themes#enable_blog_post", as: :enable_blog_post


    # Contacts
    get "administrator/contact_messages" => "admin_contact_messages#index", as: :admin_contact_messages
    get "administrator/contact_message/details/:contact_message_id" => "admin_contact_messages#details", as: :admin_contact_message_details

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
    #match "/404", :to => "errors#not_found", :via => :all
    match "/500", :to => "errors#internal_server_error", :via => :all

  end
end
