require 'spec_helper'

describe(Project) do
  describe('.all') do
    it("starts off with no projects") do
      expect(Project.all).to(eq([]))
    end
  end

  describe("#name") do
    it("returns the name of a project") do
      project = Project.new({:name => 'Morrison Bridge', :description => "repair damage", :id => nil})
      expect(project.name).to(eq("Morrison Bridge"))
    end
  end

  describe("#description") do
    it("returns the description of a project") do
      project = Project.new({:name => 'Morrison Bridge', :description => "repair damage", :id => nil})
      expect(project.description).to(eq("repair damage"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      project = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      project.save()
      expect(project.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save projects to the database") do
      project = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      project.save()
      expect(Project.all).to(eq([project]))
    end
  end

  describe("#==") do
    it("is the same project if it has the same name") do
      project1 = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      project2 = Project.new({:name => "Morrison Bridge", :description => "repair damage", :id => nil})
      expect(project1).to(eq(project2))
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


end
