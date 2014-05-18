class TicketsController < ApplicationController
  before_action :signed_in_user
  
  def show
    @showing = Showing.find(params[:id])
	@ticket = Ticket.new(showing_id: params[:id1], user_id: @current_user, discount_id: 1, ticket_status_id: 1)
  end
  
  def confirm
    @ticket = Ticket.new(showing_id: params[:id1], user_id: @current_user, discount_id: 1, ticket_status_id: 1)
    @ticket_seat_showing = TicketSeatShowing.new(seat_id: params[:id2], showing_id: @showing)
  end
 
end