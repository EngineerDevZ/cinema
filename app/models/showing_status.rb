class ShowingStatus < ActiveRecord::Base
  has_many :showings
  validates :name, presence: true, length: { maximum: 20 }
end
