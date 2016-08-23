class YahooPresentDataApi < ApplicationRecord

  def get_data(ticker)
    @ticker = ticker
    url = "http://finance.yahoo.com/d/quotes.csv?s=#{ticker}&f=abb2b3poydr1qc1cc6k2p2d1d2t1c8c3ghk1ll1t8m5m6m7m8m3m4w1w4p1mm2g1g3g4g5g6kjj5k4j6k5wij1j3f6nn4ss1xj2va5b6k3a2t7t6i5l2l3v1v7s6ee7e8e9b4j4p5p6rr2r5r6r7s7"
    @response = HTTParty.get(url).body
  end

  def parse_data
    my_hash = Hash.new
    my_hash["ask"] => @response[0]
    my_hash["bid"] => @response[1]
    my_hash["ask_(realtime)"] => @response[2]
    my_hash["bid_(realtime)"] => @response[3]
    my_hash["previous_close"] => @response[4]
    my_hash["open"] => @response[5]
    my_hash["dividend_yield"] => @response[6]
    my_hash["dividend_per_share"] => @response[7]
    my_hash["dividend_pay_date"] => @response[8]
    my_hash["ex_dividend_date"] => @response[9]
    my_hash["change"] => @response[10]
    my_hash["change_and_percent_change"] => @response[11]
    my_hash["change_(realtime)"] => @response[12]
    my_hash["change_percent_(realtime)"] => @response[13]
    my_hash["change_in_percent"] => @response[14]
    my_hash["last_trade_date"] => @response[15]
    my_hash["trade_date"] => @response[16]
    my_hash["last_trade_time"] => @response[17]
    my_hash["after_hours_change_(realtime)"] => @response[18]
    my_hash["commission"] => @response[19]
    my_hash["day's_low"] => @response[20]
    my_hash["day's_high"] => @response[21]
    my_hash["last_trade_(realtime)_with_time"] => @response[22]
    my_hash["last_trade_(with_time)"] => @response[23]
    my_hash["last_trade_(price_only)"] => @response[24]
    my_hash["1_year_target_price"] => @response[25]
    my_hash["change_from_200_day_moving_average"] => @response[26]
    my_hash["percent_change_from_200_day_moving_average"] => @response[27]
    my_hash["change_from_50_day_moving_average"] => @response[28]
    my_hash["percent_change_from_50_day_moving_average"] => @response[29]
    my_hash["50_day_moving_average"] => @response[30]
    my_hash["200_day_moving_average"] => @response[31]
    my_hash["day's_value_change"] => @response[32]
    my_hash["day's_value_change_(realtime)"] => @response[33]
    my_hash["price_paid"] => @response[34]
    my_hash["day's_range"] => @response[35]
    my_hash["day's_range_(realtime)"] => @response[36]
    my_hash["holdings_gain_percent"] => @response[37]
    my_hash["annualized_gain"] => @response[38]
    my_hash["holdings_gain"] => @response[39]
    my_hash["holdings_gain_percent_(realtime)"] => @response[40]
    my_hash["holding_gain_(realtime)"] => @response[41]
    my_hash["52_week_high"] => @response[42]
    my_hash["52_week_low"] => @response[43]
    my_hash["change_from_52_week_low"] => @response[44]
    my_hash["change_from_52_week_high"] => @response[45]
    my_hash["percent_change_from_52_week_low"] => @response[46]
    my_hash["percent_change_from_52_week_high"] => @response[47]
    my_hash["52_week_range"] => @response[48]
    my_hash["more_info"] => @response[49]
    my_hash["market_capitalization"] => @response[50]
    my_hash["market_cap_(realtime)"] => @response[51]
    my_hash["float_shares"] => @response[52]
    my_hash["name"] => @response[53]
    my_hash["notes"] => @response[54]
    my_hash["symbol"] => @response[55]
    my_hash["shares_owned"] => @response[56]
    my_hash["stock_exchange"] => @response[57]
    my_hash["shares_outstanding"] => @response[58]
    my_hash["volume"] => @response[59]
    my_hash["ask_size"] => @response[60]
    my_hash["bid_size"] => @response[61]
    my_hash["last_trade_size"] => @response[62]
    my_hash["average_daily_volume"] => @response[63]
    my_hash["ticker_trend"] => @response[64]
    my_hash["trade_links"] => @response[65]
    my_hash["order_book_(realtime)"] => @response[66]
    my_hash["high_limit"] => @response[67]
    my_hash["low_limit"] => @response[68]
    my_hash["holding_value"] => @response[69]
    my_hash["holding_value_realtime"] => @response[70]
    my_hash["revenue"] => @response[71]
    my_hash["earnings_per_share"] => @response[72]
    my_hash["eps_estimate_current_year"] => @response[73]
    my_hash["eps_estimate_next_year"] => @response[74]
    my_hash["eps_estimate_next_quarer"] => @response[75]
    my_hash["book_value"] => @response[76]
    my_hash["ebitda"] => @response[77]
    my_hash["price/sales"] => @response[78]
    my_hash["price/book"] => @response[79]
    my_hash["p/e_ratio"] => @response[80]
    my_hash["p/e_ration_(realtime)"] => @response[81]
    my_hash["peg_ratio"] => @response[82]
    my_hash["price/eps_estimate_current_year"] => @response[83]
    my_hash["price/eps_estimate_next_year"] => @response[84]
    my_hash["short_ratio"] => @response[85]
  end

end