require 'sinatra'
require 'dwolla'
require './keys'

Dwolla::token = @token
Dwolla::debug = true
Dwolla::sandbox = true


post '/dwollify' do
  Dwolla::Transactions.send({
    :destinationId => params[:email],
    :destinationType => 'Email',
    :amount => params[:amount],
    :pin => @pin,
    :notes => 'Everyone loves getting money'
  })
  return {sucess:true}.to_json
end
