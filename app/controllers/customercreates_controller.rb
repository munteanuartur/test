class CustomercreatesController < ApplicationController
	#$appid = Rails.application.credentials.dig(:appid)
	#$secret = Rails.application.credentials.dig(:secret)
	$appid = "uBtTDa79PwtiBQ0EtXX72iyyeou5Fx3Ss8oX9ljGhR4"
	$secret = "gWOZgOIyc7CMWVI5xzuPstcQNRgaBSAzhIbFILrBjgI"

  before_action :authenticate_user!
  def show

  	begin
  		email1 = current_user.email
			url1 = 'https://www.saltedge.com/api/v5/customers/'
			payload = {"data": { "identifier": "#{email1}"}}

			@response = RestClient::Request.execute(method: :post, 
									   url: url1, 
									   headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret}, 
									   payload: payload)	
			@json = JSON.parse(@response.body)
			@cod = @response.code
		
			@final = @json["data"]["id"]
		rescue
			redirect_to :controller => 'homes', :action => 'index' 
		end
		
		
  end
end
