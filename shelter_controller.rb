require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/animal.rb')
require_relative('./models/owner.rb')

get '/' do
  "Hello World"
end

get '/animals' do
  @animals = Animal.all()
  erb(:index)
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:edit)
end

post '/animals/:id/toggle-adoptable' do
  Animal.change_adoptability(params[:id], params[:adoptability])
  redirect to "/animals/#{params[:id]}/edit"
end
