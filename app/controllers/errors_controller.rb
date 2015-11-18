class ErrorsController < ApplicationController

  def routing
    render file: "#{Rails.root}/public/administrator/404.html.erb", status: 404, layout: false
  end

end
