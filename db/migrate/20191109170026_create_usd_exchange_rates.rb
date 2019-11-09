class CreateUsdExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :usd_exchange_rates do |t|
      t.integer  :rate, null: false
      t.boolean  :is_forced
      t.datetime :expiration_date
      t.timestamps
    end
  end
end
