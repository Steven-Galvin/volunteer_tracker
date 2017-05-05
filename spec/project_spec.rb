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

end
