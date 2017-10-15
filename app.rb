require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('pets_controller')
require_relative('owner_controller')


get '/' do
  erb( :index )
end
