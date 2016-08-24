Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'hist/:ticker' => 'yahoo_historical_prices_api#call'
  get '/:ticker' => 'yahoo_present_data_api#call'
  root 'application#root'

end
