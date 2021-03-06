class Project
  attr_reader(:name, :description, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @description = attributes[:description]
    @id = attributes[:id]
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      name = project.fetch("name")
      description = project.fetch("description")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:name => name, :description => description, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (name, description) VALUES ('#{@name}', '#{@description}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def ==(another_project)
    self.name == another_project.name
  end

  def self.find(id)
    result = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    name = result.first().fetch("name")
    description = result.first().fetch("description")
    Project.new({:name => name, :description => description, :id => id})
  end

  def update (attributes)
    @name = attributes.fetch(:name, @name)
    @description = attributes.fetch(:description, @description)
    DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{self.id};")
    DB.exec("UPDATE projects SET description = '#{@description}' WHERE id = #{self.id};")

  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id}")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{self.id()};")
  end

  def volunteers
    project_volunteers = []
    volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id};")
    volunteers.each do |volunteer|
      name = volunteer.fetch('name')
      project_id = volunteer.fetch('project_id').to_i
      id = volunteer.fetch('id').to_i
      project_volunteers.push(Volunteer.new({:name => name, :project_id => project_id}))
    end
    project_volunteers
  end

  def self.search_project (search)
    searched_projects = []
    projects = DB.exec("SELECT * FROM projects WHERE LOWER (name) LIKE LOWER('#{search}%');")
    projects.each do |project|
      name = project.fetch('name')
      description = project.fetch('description')
      id = project.fetch('id').to_i
      searched_projects.push(Project.new({:name => name, :description => description, :id => id}))
    end
    searched_projects
  end
end
