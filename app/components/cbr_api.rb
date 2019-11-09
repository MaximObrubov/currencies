module CBR_API
  def self.courses
    @courses ||= request()
  end
  
  def self.request
  end
end