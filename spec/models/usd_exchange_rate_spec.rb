require 'rails_helper'

RSpec.describe UsdExchangeRate, type: :model do
  
  it "is valid" do
    expect(UsdExchangeRate.new({
      rate: 1,
      is_forced: false,
      expiration_date: nil,
    })).to be_valid

    expect(UsdExchangeRate.new({
      rate: 1,
      is_forced: true,
      expiration_date: '3rd Feb 2021 04:05:06 PM',
    })).to be_valid

    expect(UsdExchangeRate.new({
      rate: 1,
      is_forced: false
    })).to be_valid
  end
  
  it "is not valid" do
    expect(UsdExchangeRate.new({
      rate: "A String",
      is_forced: false,
      expiration_date: nil,
    })).to_not be_valid

    expect(UsdExchangeRate.new({
      rate: 1,
      is_forced: true,
      expiration_date: "time to fun",
    })).to_not be_valid

    expect(UsdExchangeRate.new({
      rate: 1,
      is_forced: 10
    })).to_not be_valid

    expect(UsdExchangeRate.new({
      rate: 1,
      is_forced: true,
      expiration_date: '3rd Feb 1988 04:05:06 PM',
    })).to_not be_valid

    expect(UsdExchangeRate.new({
      rate: 1,
      is_forced: true,
    })).to_not be_valid
  end
  
end
