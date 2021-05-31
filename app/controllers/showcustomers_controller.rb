class ShowcustomersController < ApplicationController
	#$appid = Rails.application.credentials.dig(:appid)
	#$secret = Rails.application.credentials.dig(:secret)
	$appid = "uBtTDa79PwtiBQ0EtXX72iyyeou5Fx3Ss8oX9ljGhR4"
	$secret = "gWOZgOIyc7CMWVI5xzuPstcQNRgaBSAzhIbFILrBjgI"
  before_action :authenticate_user!
  def show
		url2 = 'https://www.saltedge.com/api/v5/customers'
		@response = RestClient::Request.execute(method: :get, 
									   url: url2, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret})
		@json = JSON.parse(@response.body)
		@ff = @json['data']
	end
end
