class Room < ApplicationRecord
  
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  attachment :roomimage
  
  validates :roomname, presence: true
  validates :roomprofile, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :roomimage, presence: true
  
end
