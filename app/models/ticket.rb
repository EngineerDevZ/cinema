class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :showing
  belongs_to :discount
  belongs_to :ticket_status
  has_one :ticket_seat_showing
end
