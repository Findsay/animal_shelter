require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/pet')
require_relative('./models/owner')
require_relative('./models/pet_owner')

get '/pet_owners' do
  @petowners = PetOwner.all()
  erb ( :"pet_owners/index")
end

get '/pet_owners/:id/assign' do
  @pet = Pet.find(params['id'])
  @owners = Owner.all()
  erb ( :"pet_owners/assign")
end

post '/pet_owners' do
  petowner = PetOwner.new(params)
  petowner.save
  redirect to("/pet_owners")
end

post '/pet_owners/:id/delete' do
  @petowner = PetOwner.find(params['id'])
  @petowner.delete()
  redirect to("/pet_owners")
end
