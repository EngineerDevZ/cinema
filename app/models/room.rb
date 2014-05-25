class Room < ActiveRecord::Base
  has_many :seats
  has_many :showings
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :room_number, presence: true, numericality: { only_integer: true, greater_than: 0}
end
