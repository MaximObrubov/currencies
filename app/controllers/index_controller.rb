class IndexController < ApplicationController\
  
  def index
    @current_usd = UsdExchangeRate.get_last
  end
  
  def admin
    if request.post?
      expiration_date = DateTime.new *datetime_array(params)
      begin
        @current_usd = UsdExchangeRate.new({
          rate: params[:rate],
          expiration_date: expiration_date,
          is_forced: true,
        })
        @current_usd.save!
        flash.now.notice = "Currency successfuly saved"
      rescue ActiveRecord::RecordInvalid => invalid
        flash.now.alert = "Currency not saved due to validation errors"
      end
    else
      begin
        # NOTE: выбираем последний форсированный курс, на текущую дату
        @current_usd = UsdExchangeRate
          .where(is_forced: true)
          .where("DATE(expiration_date) >= ?", DateTime.now)
          .last
      rescue ActiveRecord::RecordNotFound => err
        flash.now.alert = "No records found"
      end
    end
  end
  
  
  private
  
  def datetime_array hash
    %w(1 2 3 4 5).map { |e| hash["expiration_date(#{e}i)"].to_i }
  end
end
