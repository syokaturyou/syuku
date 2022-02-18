class Room < ApplicationRecord
  
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  attachment :roomimage
  
  validates :roomname, presence: true
  validates :roomprofile, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { less_than_or_equal_to: 1000000, 
                                  greater_than_or_equal_to: 100 }
  validates :roomimage, presence: true
  
  def self.search(keyword)
   where(["roomname like? OR address like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
  def self.search(area)
   where(["address like?", "%#{area}%"])
  end
  
end
