class YahooHistoricalPricesApiController < ApplicationController

  def call
    api_call = YahooHistoricalPricesApi.new
    @prices = api_call.get_prices(params[:ticker])
    @prices = api_call.parse_prices
    render json: @prices
  end

end
