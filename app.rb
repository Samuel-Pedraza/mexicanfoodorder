require 'twilio-ruby'
require 'sinatra'

account_sid = "ACc19bebccafc8fb9e962782f4bbbac9b3"
auth_token = "0cd23be8ddc1932fc372b3dbd2836601"

get "/" do
	erb :index
end

post "/" do
	@name = params[:name]
	@order = params[:order]
	@time = params[:time]

	client = Twilio::REST::Client.new account_sid, auth_token

	client.messages.create(
	  from: '+15034769695',
	  to: '+19713029110',
	  body: "Name: " +  @name + "\n" + "Order: " + @order +  "\n" + "Time to pick up: " + @time
	)

	return "Message has been sent!"
end
