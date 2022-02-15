class Reservation < ApplicationRecord
  
  belongs_to :user
  belongs_to :room
  
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :human, presence: true
  
end
