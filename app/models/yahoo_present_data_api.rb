class YahooPresentDataApi < ApplicationRecord

  def get_data(ticker)
    @ticker = ticker
    url = "http://finance.yahoo.com/d/quotes.csv?s=#{ticker}&f=abb2b3poydr1qc1cc6k2p2d1d2t1c8c3ghk1ll1t8m5m6m7m8m3m4w1w4p1mm2g1g3g4g5g6kjj5k4j6k5wij1j3f6nn4ss1xj2va5b6k3a2t7t6i5l2l3v1v7s6ee7e8e9b4j4p5p6rr2r5r6r7s7"
    @response = HTTParty.get(url).body
  end

  def parse_data
    @parsed_response = @response.chomp.split(',')
    p @parsed_response.count("N/A")
    @parsed_response
  end

  def hashify_data
    if @parsed_response.count("N/A") < 85
      my_hash = Hash.new
      my_hash["ask"] = @parsed_response[0]
      my_hash["bid"] = @parsed_response[1]
      my_hash["ask_(realtime)"] = @parsed_response[2]
      my_hash["bid_(realtime)"] = @parsed_response[3]
      my_hash["previous_close"] = @parsed_response[4]
      my_hash["open"] = @parsed_response[5]
      my_hash["dividend_yield"] = @parsed_response[6]
      my_hash["dividend_per_share"] = @parsed_response[7]
      my_hash["dividend_pay_date"] = @parsed_response[8]
      my_hash["ex_dividend_date"] = @parsed_response[9]
      my_hash["change"] = @parsed_response[10]
      my_hash["change_and_percent_change"] = @parsed_response[11]
      my_hash["change_(realtime)"] = @parsed_response[12]
      my_hash["change_percent_(realtime)"] = @parsed_response[13]
      my_hash["change_in_percent"] = @parsed_response[14]
      my_hash["last_trade_date"] = @parsed_response[15]
      my_hash["trade_date"] = @parsed_response[16]
      my_hash["last_trade_time"] = @parsed_response[17]
      my_hash["after_hours_change_(realtime)"] = @parsed_response[18]
      my_hash["commission"] = @parsed_response[19]
      my_hash["day's_low"] = @parsed_response[20]
      my_hash["day's_high"] = @parsed_response[21]
      my_hash["last_trade_(realtime)_with_time"] = @parsed_response[22]
      my_hash["last_trade_(with_time)"] = @parsed_response[23]
      my_hash["last_trade_(price_only)"] = @parsed_response[24]
      my_hash["1_year_target_price"] = @parsed_response[25]
      my_hash["change_from_200_day_moving_average"] = @parsed_response[26]
      my_hash["percent_change_from_200_day_moving_average"] = @parsed_response[27]
      my_hash["change_from_50_day_moving_average"] = @parsed_response[28]
      my_hash["percent_change_from_50_day_moving_average"] = @parsed_response[29]
      my_hash["50_day_moving_average"] = @parsed_response[30]
      my_hash["200_day_moving_average"] = @parsed_response[31]
      my_hash["day's_value_change"] = @parsed_response[32]
      my_hash["day's_value_change_(realtime)"] = @parsed_response[33]
      my_hash["price_paid"] = @parsed_response[34]
      my_hash["day's_range"] = @parsed_response[35]
      my_hash["day's_range_(realtime)"] = @parsed_response[36]
      my_hash["holdings_gain_percent"] = @parsed_response[37]
      my_hash["annualized_gain"] = @parsed_response[38]
      my_hash["holdings_gain"] = @parsed_response[39]
      my_hash["holdings_gain_percent_(realtime)"] = @parsed_response[40]
      my_hash["holding_gain_(realtime)"] = @parsed_response[41]
      my_hash["52_week_high"] = @parsed_response[42]
      my_hash["52_week_low"] = @parsed_response[43]
      my_hash["change_from_52_week_low"] = @parsed_response[44]
      my_hash["change_from_52_week_high"] = @parsed_response[45]
      my_hash["percent_change_from_52_week_low"] = @parsed_response[46]
      my_hash["percent_change_from_52_week_high"] = @parsed_response[47]
      my_hash["52_week_range"] = @parsed_response[48]
      my_hash["more_info"] = @parsed_response[49]
      my_hash["market_capitalization"] = @parsed_response[50]
      my_hash["market_cap_(realtime)"] = @parsed_response[51]
      my_hash["float_shares"] = @parsed_response[52]
      my_hash["name"] = @parsed_response[53]
      my_hash["notes"] = @parsed_response[54]
      my_hash["symbol"] = @parsed_response[55]
      my_hash["shares_owned"] = @parsed_response[56]
      my_hash["stock_exchange"] = @parsed_response[57]
      my_hash["shares_outstanding"] = @parsed_response[58]
      my_hash["volume"] = @parsed_response[59]
      my_hash["ask_size"] = @parsed_response[60]
      my_hash["bid_size"] = @parsed_response[61]
      my_hash["last_trade_size"] = @parsed_response[62]
      my_hash["average_daily_volume"] = @parsed_response[63]
      my_hash["ticker_trend"] = @parsed_response[64]
      my_hash["trade_links"] = @parsed_response[65]
      my_hash["order_book_(realtime)"] = @parsed_response[66]
      my_hash["high_limit"] = @parsed_response[67]
      my_hash["low_limit"] = @parsed_response[68]
      my_hash["holding_value"] = @parsed_response[69]
      my_hash["holding_value_realtime"] = @parsed_response[70]
      my_hash["revenue"] = @parsed_response[71]
      my_hash["earnings_per_share"] = @parsed_response[72]
      my_hash["eps_estimate_current_year"] = @parsed_response[73]
      my_hash["eps_estimate_next_year"] = @parsed_response[74]
      my_hash["eps_estimate_next_quarer"] = @parsed_response[75]
      my_hash["book_value"] = @parsed_response[76]
      my_hash["ebitda"] = @parsed_response[77]
      my_hash["price/sales"] = @parsed_response[78]
      my_hash["price/book"] = @parsed_response[79]
      my_hash["p/e_ratio"] = @parsed_response[80]
      my_hash["p/e_ration_(realtime)"] = @parsed_response[81]
      my_hash["peg_ratio"] = @parsed_response[82]
      my_hash["price/eps_estimate_current_year"] = @parsed_response[83]
      my_hash["price/eps_estimate_next_year"] = @parsed_response[84]
      my_hash["short_ratio"] = @parsed_response[85]

      my_hash.to_json
    else
      { error: "Invalid Ticker", ticker: "#{@ticker}" }.to_json
    end
  end

end
