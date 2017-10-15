require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/pet')
require_relative('./models/owner')

get '/owners' do
  @owners = Owner.all()
  erb ( :"owner/index")
end
