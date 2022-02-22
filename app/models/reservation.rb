class Reservation < ApplicationRecord
  
  belongs_to :user
  belongs_to :room
  
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :human, presence: true, numericality: { less_than_or_equal_to: 20, greater_than_or_equal_to: 1 }
  validate :start_end_check
  validate :date_before_start

  def start_end_check
    errors.add(:enddate, "は開始日以降の日を登録してください") unless
    startdate == nil or enddate == nil or startdate < enddate
  end
  
  def date_before_start
    errors.add(:startdate, "は今日以降のものを選択してください") if  startdate != nil and enddate != nil and startdate < Date.today
  end
  
end
