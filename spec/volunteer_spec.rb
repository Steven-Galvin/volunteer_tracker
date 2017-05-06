require "spec_helper"

describe(Volunteer) do
  describe("#==") do
    it("is the same volunteer they have the same first and last name") do
      test_volunteer1 = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => 1})
      test_volunteer2 = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => 1})
      expect(test_volunteer1 == test_volunteer2).to(eq(true))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe("#name") do
    it("returns first name of volunteer") do
      test_volunteer = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => 1})
      expect(test_volunteer.name).to(eq("Steven Galvin"))
    end
  end

  describe("#project_id") do
    it("lets you read the project ID out") do
      test_volunteer = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => 1})
      expect(test_volunteer.project_id).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a volunteer to the array of saved volunteers") do
      test_volunteer = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => 1})
      test_volunteer.save
      expect(Volunteer.all).to(eq([test_volunteer]))
    end
  end

  describe("#id") do
    it("sets the ID when you save it") do
      test_volunteer = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => 1})
      test_volunteer.save()
      expect(test_volunteer.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a volunteer by its id") do
      test_volunteer1 = Volunteer.new({:name => "Steven Galvin", :project_id => 1, :id => nil})
      test_volunteer1.save()
      test_volunteer2 = Volunteer.new({:name => "Arianna Chau", :project_id => 1, :id => nil})
      test_volunteer2.save()
      expect(Volunteer.find(test_volunteer2.id)).to(eq(test_volunteer2))
    end
  end

  describe('#update') do
    it('lets you change the name of a volunteer') do
      test_volunteer = Volunteer.new({:name => "Steven Gavin", :project_id => 1, :id => nil})
      test_volunteer.save
      test_volunteer.update({:name => "Steven Galvin", :project_id => 1, :id => nil})
      expect(test_volunteer.name).to(eq("Steven Galvin"))
    end
  end

  describe('.search_volunteer') do
    it('returns a list of volunteers from database') do
      test_volunteer1 = Volunteer.new({:name => "Steven Galvin", :project_id => 1, :id => nil})
      test_volunteer1.save()
      test_volunteer2 = Volunteer.new({:name => "Arianna Chau", :project_id => 1, :id => nil})
      test_volunteer2.save()
      expect(Volunteer.search_volunteer("Arianna Chau")).to(eq([test_volunteer2]))
    end
  end
end
