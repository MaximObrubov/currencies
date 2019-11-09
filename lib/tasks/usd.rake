namespace :usd do
  desc "Gets actual RBC exchange rate for USD and stores it in a db"
  task get: :environment do
    rate = UsdExchangeRate.new({
      rate: CBR_API::courses[:Valute][:USD][:Value].to_f,
      is_forced: false,
    })
    
    unless rate.valid?
      message = rate.errors.reduce("") do |akk, error|
        akk += "#{error},"
      end
      raise("Not valid: #{message}")
    end
    rate.save!
  rescue StandardError => e
    STDERR.puts "Getting USD exchange rate failed: #{e.message}"
  end

end
