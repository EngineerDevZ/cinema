class ShowingsController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :index, :new, :create]
  
  def index
    @sshowings = Showing.paginate(page: params[:page])
  end
  
  def show
    @movie = Movie.find(params[:id])
    @showings2 = Showing.where(movie_id: params[:id], showing_status_id: 1)
	@showings = Array.new
	@showings2.each do |x|
	  if x.date.to_date == params[:date].to_date
	    @showings.push(x)
	  end
	end
  end
  
  def edit
    @showing = Showing.find(params[:id])
  end
  
  def update
    @showing = Showing.find(params[:id])
    if @showing.update_attributes(showing_params)
      flash[:success] = "Showing updated"
      redirect_to showings_url
    else
      render 'edit'
    end
  end
  
  def new
    @showing = Showing.new
  end

  def create
    @showing = Showing.new(showing_params)
    if @showing.save
      flash[:success] = "Showing added!"
      redirect_to showings_url
    else
      render 'new'
    end
  end
  
  private
  
    def showing_params
      params.require(:showing).permit(:price, :date, :is3d, :vat, :movie_id, :showing_status_id, :room_id)
    end
  
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
 
end