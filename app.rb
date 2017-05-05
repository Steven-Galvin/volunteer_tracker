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
  @volunteers = Volunteer.all
  erb(:index)
end

post('/') do
  @projects = Project.all
  @volunteers = Volunteer.all
  project_name = params.fetch("project_name")
  project = Project.new({:name => project_name, :id => nil})
  project.save
  erb(:index)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  erb(:project)
end

post('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  volunteer_name = params.fetch("volunteer_name")
  project_id = params.fetch("project_id").to_i
  volunteer = Volunteer.new({:name => volunteer_name, :project_id => project_id, :id => nil})
  volunteer.save
  erb(:project)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch("id").to_i)
  erb(:volunteer)
end
