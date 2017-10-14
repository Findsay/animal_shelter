require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('./models/pet')

get '/pets' do
  @pets = Pet.all()
  erb ( :"pets/index")
end

get '/pets/:id' do
  @pet = Pet.find(params['id'])
  erb( :"pets/show" )
end

get '/pets/:id/edit' do
  @pet = Pet.find(params['id'])
  erb( :"pets/edit" )
end

post '/pets/:id' do
  @pet = Pet.new(params)
  @pet.update()
  erb( :"pets/show" )
end
