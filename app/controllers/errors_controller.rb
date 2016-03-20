class ErrorsController < ApplicationController

  def routing
    render file: "#{Rails.root}/public/administrator/404.html.erb", status: 404, layout: false
  end

  def internal_server_error
    render file: "#{Rails.root}/public/administrator/500.html.erb", status: 500, layout: false
  end

end
