require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/pet')
require_relative('./models/owner')
require_relative('pets_owner_controller')

get '/pets' do
  @pets = Pet.all()
  erb ( :"pets/index")
end

get '/pets/new' do
  @owners = Owner.all()
  erb( :"pets/new" )
end

get '/pets/trained' do
  @pets = Pet.trained("Yes")
  erb (:"pets/trained")
end

get '/pets/untrained' do
  @pets = Pet.trained("No")
  erb (:"pets/untrained")
end

get '/pets/:id' do
  @pet = Pet.find(params['id'])
  erb( :"pets/show" )
end

get '/pets/:id/edit' do
  @pet = Pet.find(params['id'])
  @owners = Owner.all()
  erb( :"pets/edit" )
end

post '/pets/:id' do
  @pet = Pet.new(params)
  @pet.update()
  erb( :"pets/show" )
end

post '/pets' do
  pet = Pet.new(params)
  pet.save
  redirect to("/pets")
end

post '/pets/:id/delete' do
  @pet = Pet.find(params['id'])
  @pet.delete()
  redirect to("/pets")
end
