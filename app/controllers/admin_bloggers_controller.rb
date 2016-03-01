class AdminBloggersController < ApplicationController
  layout "administrator"

  def blogger
    init_bloggers

    @blogger = Blogger.new
  end

  def create_blogger
    init_bloggers

    @blogger = Blogger.new(params.require(:blogger).permit(:title, :name, :content, :description_image, :description_text).merge(user_id: (current_user.id rescue nil)))

    if @blogger.save
    flash[:success] = "Le bloggeur a été correctement créé."
      @blogger = Blogger.new
    else
      flash[:error] = @blogger.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    redirect_to admin_blogger_path
  end

  def bloggers
    init_bloggers

    @bloggers = Blogger.all.order("created_at DESC")
  end

  def edit_blogger
    @blogger = Blogger.find_by_id(params[:blogger_id])

    if @blogger.blank?
      flash[:error] = "Ce bloggeur n'existe pas"
      redirect_to admin_bloggers_path
    end
  end

  def update_blogger
    @blogger = Blogger.find_by_id(params[:blogger][:id])

    unless @blogger
      flash[:error] = "Ce bloggeur n'existe pas."
      redirect_to :back
    else
      @blogger.assign_attributes(params.require(:blogger).permit(:title, :name, :content, :description_image, :description_text))
      if @blogger.valid?
        @blogger.save
        flash.now[:success] = "Le bloggeur a été mis à jour."
      else
        flash.now[:error] = @blogger.errors.full_messages.map { |msg| "#{msg}<br />" }.join
      end
    end

    render :edit_blogger
  end

  def disable_blogger
    enable_disable_blogger(params[:blogger_id], false, "désactivé")
  end

  def enable_blogger
    enable_disable_blogger(params[:blogger_id], true, "activé")
  end

  private
    def init_bloggers
    @website_blog_menu_style = "current"
    @blogger_menu_style = "this"
  end

    def enable_disable_blogger(blogger_id, status, status_text)
      blogger = Blogger.find_by_id(blogger_id)

      if blogger.blank?
        flash[:error] = "Ce bloggeur n'existe pas."
      else
        blogger.update_attributes(published: status)
        flash[:success] = "Le bloggeur a été #{status_text}."
      end

      redirect_to admin_bloggers_path
    end
end
