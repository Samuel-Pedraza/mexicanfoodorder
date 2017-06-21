require 'twilio-ruby'
require 'sinatra'

account_sid = "ACc19bebccafc8fb9e962782f4bbbac9b3"
auth_token = "0cd23be8ddc1932fc372b3dbd2836601"

get "/" do
	erb :index
end

post "/" do
	@query = params[:q]

	client = Twilio::REST::Client.new account_sid, auth_token

	client.messages.create(
	  from: '+15034769695',
	  to: '+19713029110',
	  body: @query
	)

	return "Message has been sent!"
end
