class CreateYahooHistoricalPricesApis < ActiveRecord::Migration[5.0]
  def change
    create_table :yahoo_historical_prices_apis do |t|

      t.timestamps
    end
  end
end
