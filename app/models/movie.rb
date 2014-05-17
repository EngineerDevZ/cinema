class Movie < ActiveRecord::Base
  belongs_to :genre
  validates :genre_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :director, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0}
end
