class YahooPresentDataApiController < ApplicationController

  def call
    api_call = YahooPresentDataApi.new
    api_call.get_data(params[:ticker])
    api_call.parse_data
    @data = api_call.hashify_data
    if @data.include?("Invalid Ticker")
      render json: @data, status: 404
    else
      render json: @data, status: 200
    end
  end

end
