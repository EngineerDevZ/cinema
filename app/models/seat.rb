class Seat < ActiveRecord::Base
  belongs_to :room
  has_many :ticket_seat_showings
end
