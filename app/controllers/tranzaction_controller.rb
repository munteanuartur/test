class TranzactionController < ApplicationController
  $appid = Rails.application.credentials.dig(:appid)
  $secret = Rails.application.credentials.dig(:secret)
  before_action :authenticate_user!
  
  def show
    
    @con_id = params[:con_id]
    @acc_id = params[:acc_id]
    
    url2 = "https://www.saltedge.com/api/v5/transactions?connection_id=#{@con_id}&account_id=#{@acc_id}"
    
    @response = RestClient::Request.execute(method: :get, url: url2, 
                     headers: {accept: 'application/json', content_type: 'application/json', App_id: $appid, Secret: $secret})
    @final = JSON.parse(@response.body)
    @f = @final["data"]
  end
end
