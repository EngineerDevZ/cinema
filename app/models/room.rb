class Room < ActiveRecord::Base
  has_many :seats
  has_many :showings
end
