require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/pet_owner')

get '/owned' do
  @pet_owners = PetOwners.all()
  erb ( :"pet_owners/index")
end
