class YahooHistoricalPricesApi < ApplicationRecord

  def get_prices(ticker)
    url = "http://ichart.finance.yahoo.com/table.csv?s=#{ticker}&ignore=.csv"
    @response = HTTParty.get(url).body
  end

  def parse_prices
    @prices = []
    CSV.parse(@response).each_with_index do |line, i|
      if i != 0
        my_hash = {
          "date" => line[0],
          "open" => line[1],
          "high" => line[2],
          "low" => line[3],
          "close" => line[4],
          "volume" => line[5],
          "adj_close" => line[6]
        }
        @prices << my_hash
      end
    end
    @prices.to_json
  end
end
