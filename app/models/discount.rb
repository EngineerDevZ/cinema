class Discount < ActiveRecord::Base
  has_many :tickets
  validates :name, presence: true, length: { maximum: 20 }
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0}
end
