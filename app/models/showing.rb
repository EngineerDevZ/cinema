class Showing < ActiveRecord::Base
  belongs_to :movie
  belongs_to :showing_status
  belongs_to :room
  has_many :tickets
  has_many :ticket_seat_showings
end
