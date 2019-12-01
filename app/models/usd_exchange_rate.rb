class UsdExchangeRate < ApplicationRecord
  
  validates :rate, presence: true, format: { with: /\A\d+(?:\.\d{0,4})?\z/ }, numericality: { greater_than_or_equal: 0}
  validates :is_forced, inclusion: { in: [true, false] }, default: false
  validate  :expiration_date_check
 
  def self.get_last
    forced = where(is_forced: true)
      .where("DATE(expiration_date) >= ?", DateTime.now)
      .last
    return forced if forced
    
    
    where(is_forced: false).last
  end
 
 
  def expiration_date_check
    if is_forced and !expiration_date.present?
      errors.add(:expiration_date, "for forced exchege rates :expiration_date should be present")
    end
    
    if expiration_date.present?
      if expiration_date.to_i < DateTime.now.to_i
        errors.add(:expiration_date, "can't be in the past")
      end
    end
  end
  
end
