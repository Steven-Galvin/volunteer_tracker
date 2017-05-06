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

  def self.find(id)
    result = DB.exec("SELECT * FROM volunteers WHERE id = #{id};")
    name = result.first().fetch("name")
    Volunteer.new({:name => name, :id => id})
  end

  def save
     result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
     @id = result.first['id'].to_i
  end

  def update (attributes)
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{self.id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id}")
  end

  def self.search_volunteer (search)
    searched_volunteers = []
    volunteers = DB.exec("SELECT * FROM volunteers WHERE LOWER (name) LIKE LOWER('#{search}%');")
    volunteers.each do |volunteer|
      name = volunteer.fetch('name')
      id = volunteer.fetch('id').to_i
      searched_volunteers.push(Volunteer.new({:name => name, :id => id}))
    end
    searched_volunteers
  end
end
