require 'net/http'
require 'uri'

class TicketsController < ApplicationController
  before_action :signed_in_user
  protect_from_forgery except: :confirm_ok
  
  def show
    @showing = Showing.find(params[:id1])
    @ticket = Ticket.new(showing_id: params[:id1], user_id: @current_user, discount_id: params[:id2], ticket_status_id: 1)
  end
  
  def confirm
    if TicketSeatShowing.where(showing_id: params[:id1], seat_id: params[:id2]).any?
		  redirect_to root_path
    end
    @session_id = Digest::MD5::hexdigest(Time.now.to_s)
    session[:psession_id] = @session_id
    @ticket = Ticket.new(showing_id: params[:id1], user_id: @current_user, discount_id: params[:id3], ticket_status_id: 1)
    @ticket_seat_showing = TicketSeatShowing.new(seat_id: params[:id2], showing_id: @showing)
    @ticket_crc = Digest::SHA1.hexdigest(@session_id.to_s + ((@ticket.showing.price - (@ticket.showing.price * (@ticket.discount.value/100.0))) * 100).to_int.to_s)
    session[:ticket_crc] = @ticket_crc
    @p24_crc = Digest::MD5::hexdigest(@session_id.to_s + "|27463|" + ((@ticket.showing.price - (@ticket.showing.price * (@ticket.discount.value/100.0))) * 100).to_int.to_s + "|5f51c15fa07e6ac9")
  end
  
  def confirm_ok
    @crc_ticket = Digest::SHA1.hexdigest(params[:p24_session_id].to_s + params[:p24_kwota].to_s)
    if params[:p24_session_id] == session[:psession_id] && @crc_ticket == session[:ticket_crc]
      #url = URI.parse('http://sandbox.przelewy24.pl/transakcja.php')
      #http = Net::HTTP.new(url.host, url.port)
      #http.request_post url.path, "p24_kwota=" + params[:p24_kwota] + "&p24_order_id=" + params[:p24_order_id] + "&p24_id_sprzedawcy=27463&p24_session_id=" + params[:p24_session_id] + "&p24_crc=" + params[:p24_crc]
  	
  	  @ticket = Ticket.create(showing_id: params[:id1], discount_id: params[:id3], ticket_status_id: 2)
      current_user.tickets << @ticket
      current_user.save

      @ticket_seat_showing = TicketSeatShowing.create(ticket_id: @ticket.id, seat_id: params[:id2], showing_id: params[:id1])

    else
      redirect_to root_path
    end
  end

  def confirm_err
  end
 
end