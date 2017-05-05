require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
