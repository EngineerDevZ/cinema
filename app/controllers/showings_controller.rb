class ShowingsController < ApplicationController
  before_action :signed_in_user
  
  def show
    @movie = Movie.find(params[:id])
    @showings = Showing.where(movie_id: params[:id])
  end
 
end