require 'spec_helper'

describe(Project) do
  describe('.all') do
    it("starts off with no projects") do
      expect(Project.all).to(eq([]))
    end
  end

  describe("#name") do
    it("returns the name of a project") do
      test_project = Project.new({:name => 'Morrison Bridge', :description => "repair damage", :id => nil})
      expect(test_project.name).to(eq("Morrison Bridge"))
    end
  end

  describe("#description") do
    it("returns the description of a project") do
      test_project = Project.new({:name => 'Morrison Bridge', :description => "repair damage", :id => nil})
      expect(test_project.description).to(eq("repair damage"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      test_project = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      test_project.save()
      expect(test_project.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save projects to the database") do
      test_project = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      test_project.save()
      expect(Project.all).to(eq([test_project]))
    end
  end

  describe("#==") do
    it("is the same project if it has the same name") do
      test_project1 = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      test_project2 = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      expect(test_project1 == test_project2).to(eq(true))
    end
  end

  describe(".find") do
    it("returns a project by its id") do
      test_project = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      test_project2 = Project.new({:name => "Lents Park", :description => "mow grass", :id => nil})
      test_project.save
      test_project2.save
      expect(Project.find(test_project2.id)).to(eq(test_project2))
    end
  end

  describe('#update') do
    it('lets you change the name of a project') do
      test_project = Project.new({:name => "Morrison Bride", :id => nil})
      test_project.save
      test_project.update({:name => "Morrison Bridge", :id => nil})
      expect(test_project.name).to(eq("Morrison Bridge"))
    end
  end

  describe('#delete') do
    it('lets you delete a project from the database') do
      test_project1 = Project.new({:name => "Morrison Bridge", :id => nil})
      test_project1.save()
      test_project2 = Project.new({:name => "Lent Park", :id => nil})
      test_project2.save()
      test_project1.delete()
      expect(Project.all()).to(eq([test_project2]))
    end
  end


  describe("#volunteers") do
    it("returns an array of volunteers for that project") do
      test_project = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      test_project.save
      test_volunteer = Volunteer.new({:name => "Steven Galvin", :id => nil, :project_id => test_project.id})
      test_volunteer.save
      test_volunteer2 = Volunteer.new({:name => "Arianna Chau", :id => nil, :project_id => test_project.id})
      test_volunteer2.save
      expect(test_project.volunteers).to(eq([test_volunteer, test_volunteer2]))
    end
  end

  describe('.search_project') do
    it('returns a list of projects from database') do
      test_project1 = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      test_project1.save()
      test_project2 = Project.new({:name => "Lents Park", :description => "mow grass", :id => nil})
      test_project2.save()
      expect(Project.search_project("Lents Park")).to(eq([test_project2]))
    end
  end
end
