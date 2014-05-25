class Seat < ActiveRecord::Base
  belongs_to :room
  has_many :ticket_seat_showings
  validates :sector, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :row, presence: true, length: { maximum: 2 }
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :room_ids, presence: true
end
