class Showing < ActiveRecord::Base
  belongs_to :movie
  belongs_to :showing_status
  belongs_to :room
end
