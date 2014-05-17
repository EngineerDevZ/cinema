class Movie < ActiveRecord::Base
  belongs_to :genre
  has_many :showings
  validates :genre_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :director, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0}
  mount_uploader :image, ImageUploader
  
  def self.per_page
    9
  end
end
