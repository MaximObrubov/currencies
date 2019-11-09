class IndexController < ApplicationController
  def index
    @current_usd = UsdExchangeRate.last
  end
  
  def admin
  end
end
