require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/pet')
require_relative('./models/owner')

get '/owners' do
  @owners = Owner.all()
  erb ( :"owner/index")
end

get '/owners/new' do
  erb( :"owner/new" )
end

post '/owners' do
  owner = Owner.new(params)
  owner.save
  redirect to("/owners")
end
