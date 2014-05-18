class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: :admin
  before_action :admin_user, only: :admin

  def home
    @movie_items = Movie.paginate(page: params[:page])
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def admin
  end
  
  private
	
	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
