class Showing < ActiveRecord::Base
  belongs_to :movie
  belongs_to :showing_status
  belongs_to :room
  has_many :tickets
  has_many :ticket_seat_showings
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :date, presence: true
  validates :date, presence: true
  validates :is3d, presence: true
  validates :vat, presence: true, numericality: { greater_than: 0}
  validates :movie_id, presence: true, numericality: { greater_than: 0}
  validates :room_id, presence: true, numericality: { greater_than: 0}
  validates :showing_status_id, presence: true, numericality: { greater_than: 0}
end
