require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/pet')
require_relative('./models/owner')
require_relative('./models/pet_owner')

get '/pet_owners' do
  @petowners = PetOwner.all()
  erb ( :"pet_owners/index")
end
