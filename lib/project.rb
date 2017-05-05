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
      id = project.fetch("id").to_i()
      projects.push(Project.new({:name => name, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def ==(another_project)
    self.name == another_project.name
  end

  def self.find(id)
    Project.all.each do |project|
      if project.id == id
        return project
      end
    end
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
end
