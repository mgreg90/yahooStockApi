class YahooPresentDataApiController < ApplicationController

  def call
    api_call = YahooPresentDataApi.new
    api_call.get_data(params[:ticker])
    api_call.parse_data
    @data = api_call.hashify_data
    render json: @data
  end

end
