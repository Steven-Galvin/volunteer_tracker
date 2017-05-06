require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')
DB = PG.connect({:dbname => "volunteer_tracker_test"})

get('/') do
  @projects = Project.all
  erb(:index)
end

post('/') do
  name = params.fetch('project_name')
  project = Project.new({:name => name, :id => nil})
  project.save
  @projects = Project.all
  erb(:index)
end

get("/project/:id") do
  @project = Project.find(params.fetch("id").to_i)
  erb(:project)
end
