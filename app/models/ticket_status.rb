class TicketStatus < ActiveRecord::Base
  has_many :tickets
  validates :name, presence: true, length: { maximum: 20 }
end
