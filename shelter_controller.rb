require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/animal.rb')
require_relative('./models/owner.rb')


get '/animals' do
  @animals = Animal.all()
  erb(:index)
end

#show input fields
get '/animals/new' do
  erb(:new)
end
#handles the submission of the new form above
post '/animals' do
  animal = Animal.new(params)
  animal.save
  redirect to '/animals'
end

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all()
  erb(:edit)
end

put '/animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to '/animals'
end

delete '/animals/:id' do # delete
  animal = Animal.find( params[:id] )
  animal.delete()
  redirect to '/animals'
end

get '/all' do
  @owners = Owner.all
  erb (:ownersanimals)
end
