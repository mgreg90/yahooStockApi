class YahooHistoricalPricesApi < ApplicationRecord

  def get_prices(ticker)
    @ticker = ticker
    url = "http://ichart.finance.yahoo.com/table.csv?s=#{ticker}&ignore=.csv"
    @response = HTTParty.get(url).body
  end

  def parse_prices
    @data = Hash.new
    @data["ticker"] = @ticker.upcase
    @data["prices"] = []
    if !@response.include?('404 Not Found')
      CSV.parse(@response).each_with_index do |line, i|
        if i != 0 && line != @response.last
          my_hash = {
            "date" => line[0],
            "open" => line[1],
            "high" => line[2],
            "low" => line[3],
            "close" => line[4],
            "volume" => line[5],
            "adj_close" => line[6]
          }
          @data["prices"] << my_hash
        end
      end
      @data["message"] = "Okay"
      @data.to_json
    else
      {
        "error" => "404 Not Found",
        "ticker" => @ticker.upcase
      }.to_json
    end
  end
end
