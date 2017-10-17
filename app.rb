require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('pets_controller')
require_relative('owner_controller')
require_relative('pets_owner_controller')


get '/' do
  erb( :home )
end
