require 'sinatra'
require 'dwolla'
require './keys'
require 'json'

Dwolla::token = @token
Dwolla::debug = true
Dwolla::sandbox = true

before do
  if request.request_method == "POST"
    body_parameters = request.body.read
    params.merge!(JSON.parse(body_parameters))
  end
end

get '/' do
  "Dwollify!!!"
end

post '/dwollify' do
  Dwolla::Transactions.send({
    :destinationId => params[:email],
    :destinationType => 'Email',
    :amount => params[:amount],
    :pin => '9999',
    :notes => 'Everyone loves getting money'
  })
  return {success:true}.to_json
end
