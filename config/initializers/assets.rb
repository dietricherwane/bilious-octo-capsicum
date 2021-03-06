# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( front/application_header.js )

Rails.application.config.assets.precompile += %w( front/slider_initializer.js )

Rails.application.config.assets.precompile += %w( front/application_footer.js )

Rails.application.config.assets.precompile += %w( front/gallery.js )

Rails.application.config.assets.precompile += %w( job/application.js )
