class UsdExchangeRate < ApplicationRecord
  
  validates :rate, presence: true, format: { with: /\A\d+(?:\.\d{0,4})?\z/ }, numericality: { greater_than_or_equal: 0}
  validates :is_forced, inclusion: { in: [true, false] }, default: false
  validate  :expiration_date_cannot_be_in_the_past
 
  def self.get_last
    forced = where(is_forced: true)
      .where("DATE(expiration_date) >= ?", DateTime.now)
      .last
    return forced if forced
    
    
    where(is_forced: false).last
  end
 
 
  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
  
end
