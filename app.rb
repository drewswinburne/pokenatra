require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'
require_relative 'models/trainers'


get '/' do
  @trainer = Trainer.all
  erb :"index"
end

get '/trainer/new' do
  erb :"trainer/new"
end

get '/trainer/:id' do
  @trainer = Trainer.find(params[:id])
  erb :"trainer/show"
end

post '/trainer/new' do
  Trainer.create(params[:trainer])
  erb :"trainer/new"
  redirect '/'
end

get '/pokemon' do
  @pokemon = Pokemon.all
  erb :"pokemon/index"
end

get '/pokemon/new' do
  erb :"pokemon/new"
end

get '/pokemon/:id/new' do
  @trainer = params[:id]
  erb :"pokemon/new"

end

post '/pokemon/new' do
  @pokemon = Pokemon.create(params[:pokemon])
  erb :"pokemon/new"
  redirect "/trainer/#{@pokemon.trainer_id}"
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

get '/pokemon/:id/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

put '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  erb :"pokemon/edit"
  redirect "/trainer/#{@pokemon.trainer_id}"
end

delete '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  erb :"pokemon/show"
  redirect '/'
end
