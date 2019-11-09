class IndexController < ApplicationController
  def index
    @current_usd = CBR_API::courses[:Valute][:USD]
  end
  
  def admin
  end
end
