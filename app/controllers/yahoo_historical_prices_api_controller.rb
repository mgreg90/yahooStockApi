class YahooHistoricalPricesApiController < ApplicationController

  def call
    api_call = YahooHistoricalPricesApi.new
    @prices = api_call.get_prices(params[:ticker])
    @prices = api_call.parse_prices
    if !@prices.include?('404 Not Found')
      render json: @prices, status: 200
    else
      render json: @prices, status: 404
    end
  end

end
