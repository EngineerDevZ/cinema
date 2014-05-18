class TicketSeatShowing < ActiveRecord::Base
  has_one :ticket
  belongs_to :seat
  belongs_to :showing
end
