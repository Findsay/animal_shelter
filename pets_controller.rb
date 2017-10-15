require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/pet')
require_relative('./models/owner')

get '/pets' do
  @pets = Pet.all()
  erb ( :"pets/index")
end

get '/pets/new' do
  @owners = Owner.all()
  erb( :"pets/new" )
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
