class TicketSeatShowing < ActiveRecord::Base
  has_one :ticket
  belongs_to :seat
  belongs_to :showing
  validates :ticket_id, presence: true
  validates :seat_id, presence: true
  validates :showing_id, presence: true
end
