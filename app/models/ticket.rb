class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :showing
  belongs_to :discount
  belongs_to :ticket_status
  has_one :ticket_seat_showing
  validates :user_id, presence: true
  validates :showing_id, presence: true
  validates :discount_id, presence: true
  validates :ticket_status_id, presence: true
end
