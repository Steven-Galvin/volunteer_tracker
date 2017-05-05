require "spec_helper"

describe(Volunteer) do
  describe("#==") do
    it("is the same volunteer they have the same first and last name") do
      volunteer1 = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => 1})
      volunteer2 = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => 1})
      expect(volunteer1 == volunteer2).to(eq(true))
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

end
