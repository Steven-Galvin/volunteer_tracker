class Volunteer
  attr_reader(:name, :project_id, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @project_id = attributes[:project_id]
    @id = attributes[:id]
  end

  def ==(another_volunteer)
    self.name == another_volunteer.name
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer["name"]
      project_id = volunteer["project_id"].to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id}))
    end
    volunteers
  end

end
