class MoviesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user, only: [:edit, :update, :index, :new, :create]
  
  def index
    @movies = Movie.paginate(page: params[:page])
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      flash[:success] = "Movie updated"
      redirect_to @movie
    else
      render 'edit'
    end
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = "Movie added!"
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def destroy
  end
  
  private

    def movie_params
      params.require(:movie).permit(:title, :director, :description, :duration, :genre_id, :remote_image_url)
    end
	
	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end