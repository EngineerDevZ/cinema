class Showing < ActiveRecord::Base
  belongs_to :movie
  belongs_to :showing_status
  belongs_to :room
  has_many :tickets
  has_many :ticket_seat_showings
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :date, presence: true
  validates_inclusion_of :is3d, :in => [true, false]
  validates :vat, presence: true, numericality: { greater_than: 0}
  validates :movie_id, presence: true, numericality: { greater_than: 0}
  validates :room_id, presence: true, numericality: { greater_than: 0}
  validates :showing_status_id, presence: true, numericality: { greater_than: 0}
  validate :validate_date

  def validate_date
    if date
      if date.year > 2100
        errors.add(:date, "has wrong year")
      end
    end
  end
end
