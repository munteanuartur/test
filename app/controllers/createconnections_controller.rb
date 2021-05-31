class CreateconnectionsController < ApplicationController
	#$appid = Rails.application.credentials.dig(:appid)
	#$secret = Rails.application.credentials.dig(:secret)
	$appid = "uBtTDa79PwtiBQ0EtXX72iyyeou5Fx3Ss8oX9ljGhR4"
	$secret = "gWOZgOIyc7CMWVI5xzuPstcQNRgaBSAzhIbFILrBjgI"

  before_action :authenticate_user!
  def show

  	url_customer_id = 'https://www.saltedge.com/api/v5/customers'
	@response_cus = RestClient::Request.execute(method: :get, 
									   url: url_customer_id, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret})

	@json1 = JSON.parse(@response_cus.body)

	@rr = @json1['data']

	@rr.each do |f|
		f.each do |z|
			if z[0] == 'id'
				@cus_id = z[1]
			end
		end	
	end

	url2 = 'https://www.saltedge.com/api/v5/connect_sessions/create'
	
	payload = {"data":{"customer_id": "#{@cus_id}","return_connection_id": true,"consent":{"scopes":["account_details", "transactions_details"]},"attempt":{"fetch_scopes":["accounts", "transactions"]}}}

	@response = RestClient::Request.execute(method: :post, url: url2, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret}, 
									   payload: payload)

	@final = JSON.parse(@response.body)
	@f = @final["data"]["connect_url"]
  end
end
