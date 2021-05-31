class ConController < ApplicationController

	#$appid = Rails.application.credentials.dig(:appid)
	#$secret = Rails.application.credentials.dig(:secret)
	$appid = "uBtTDa79PwtiBQ0EtXX72iyyeou5Fx3Ss8oX9ljGhR4"
	$secret = "gWOZgOIyc7CMWVI5xzuPstcQNRgaBSAzhIbFILrBjgI"
  before_action :authenticate_user!
  def index
  	url_customer_id = 'https://www.saltedge.com/api/v5/customers'
		@response_cus = RestClient::Request.execute(method: :get, 
									   url: url_customer_id, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret})

		@json1 = JSON.parse(@response_cus.body)

		@res_cod = @response_cus.code

		@rr = @json1['data']

		@rr.each do |f|
			f.each do |z|
				if z[0] == 'id'
					@customer_id = z[1]
				end
			end	
		end
		url2 = "https://www.saltedge.com/api/v5/connections?customer_id=#{@customer_id}"
		@response = RestClient::Request.execute(method: :get, url: url2, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret})

		@list = JSON.parse(@response)
		@ff = @list["data"]		
  end

  def delete
  	
		@yy = params[:id]

  	url = "https://www.saltedge.com/api/v5/connections/#{@yy}"
		
		payload = {"data": {"fetch_scopes": ["accounts","transactions"]}}

		@response_cus = RestClient::Request.execute(method: :delete, 
									   url: url, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret},
									   payload: payload)

		@json1 = JSON.parse(@response_cus.body)
  end

  def reconect
  	begin
  		@con_id = params[:id]
  		@cus_id = params[:r]
  		url2 = "https://www.saltedge.com/api/v5/connect_sessions/reconnect"
		payload = {"data": {"customer_id": "#{@cus_id}","connection_id": "#{@con_id}","consent": {"scopes": ["account_details", "transactions_details"]},"attempt": {"fetch_scopes": ["accounts", "transactions" ]}}}
		@response = RestClient::Request.execute(method: :post, url: url2, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret}, 
									   payload: payload)

		@final = JSON.parse(@response.body)
		@f = @final["data"]["connect_url"]
	rescue
		redirect_to :controller => 'con', :action => 'index'
	end
  end
  def refresh
  	begin
  		@con_id = params[:id]
  	
  		url2 = "https://www.saltedge.com/api/v5/connect_sessions/refresh"
		payload = {"data": {"connection_id": "#{@con_id}"}}
		@response = RestClient::Request.execute(method: :post, url: url2, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret}, 
									   payload: payload)
		@final = JSON.parse(@response.body)
		@f = @final["data"]["connect_url"]
	rescue
		redirect_to :controller => 'con', :action => 'index'
	end
  end 
end