class Genre < ActiveRecord::Base
  has_many :movies
  validates :name, presence: true, length: { maximum: 30 }
end
