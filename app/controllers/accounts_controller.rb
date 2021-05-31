class AccountsController < ApplicationController
	#$appid = Rails.application.credentials.dig(:appid)
	#$secret = Rails.application.credentials.dig(:secret)
	$appid = "uBtTDa79PwtiBQ0EtXX72iyyeou5Fx3Ss8oX9ljGhR4"
	$secret = "gWOZgOIyc7CMWVI5xzuPstcQNRgaBSAzhIbFILrBjgI"
	before_action :authenticate_user!
	def new
		url_customer_id = 'https://www.saltedge.com/api/v5/customers'
		@response_cus = RestClient::Request.execute(method: :get, 
									   url: url_customer_id, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret})
		@json1 = JSON.parse(@response_cus.body)
		@rr = @json1['data']
		@rr.each do |f|
			f.each do |z|
				if z[0] == 'id'
					@customer_id = z[1]
				end
			end	
		end
		url2 = "https://www.saltedge.com/api/v5/connections?customer_id=#{@customer_id}"
		@response1 = RestClient::Request.execute(method: :get, url: url2, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret})
		@list = JSON.parse(@response1)
		@ff = @list["data"]
		a = []
		@ff.each do |f|
			a << f['id']
		end 
		
		b = []
		a.each do |con_id|
			url1 = "https://www.saltedge.com/api/v5/accounts?connection_id=#{con_id}"
			@response = RestClient::Request.execute(method: :get, 
									   url: url1, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret})
			@json = JSON.parse(@response.body)
			b << @json["data"]
		end
 
		@array = []
		@f = b
		@f.each do |item|
			@array << item
		end
		
		@conect_id = params[:id]

	end

	def show
	end
end
