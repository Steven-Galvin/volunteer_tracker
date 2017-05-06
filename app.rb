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
  description = params.fetch('description')
  project = Project.new({:name => name, :description => description, :id => nil})
  project.save
  @projects = Project.all
  erb(:index)
end

get("/project/:id") do
  @project = Project.find(params.fetch("id").to_i)
  erb(:project)
end

post("/project/:id") do
  name = params.fetch('volunteer_name')
  project_id = params.fetch('project_id')
  volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  volunteer.save
  @project = Project.find(params.fetch("id").to_i)
  @volunteers = Volunteer.all
  erb(:project)
end

patch("/project/:id") do
  name = params.fetch('project_name')
  @project = Project.find(params.fetch("id").to_i)
  @project.update({:name => name})
  erb(:project)
end

delete("/project/:id") do
  @project = Project.find(params.fetch("id").to_i)
  @project.delete()
  @projects = Project.all()
  erb(:index)
end
