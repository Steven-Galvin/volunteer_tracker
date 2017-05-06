require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the volunteer & project tracker path", {:type => :feature}) do
  it("adds project into list on home page") do
    visit("/")
    fill_in("project_name", :with => "Morrison")
    click_button("Add Project")
    expect(page).to have_content("Morrison")
  end
end

describe("the view project path", {:type => :feature}) do
  it("views details of single project") do
    visit("/")
    fill_in("project_name", :with => "Morrison")
    click_button("Add Project")
    click_on("Morrison")
    expect(page).to have_content("Add a new volunteer:")
  end
end

describe("the update project path", {:type => :feature}) do
  it("update details of single project") do
    visit("/")
    fill_in("project_name", :with => "Morrison")
    click_button("Add Project")
    click_on("Morrison")
    fill_in("project_name", :with => "Lents")
    click_button("Update Project")
    expect(page).to have_content("Lents")
  end
end

describe("the delete project path", {:type => :feature}) do
  it("delete a project") do
    visit("/")
    fill_in("project_name", :with => "Morrison")
    click_button("Add Project")
    click_on("Morrison")
    click_button("Delete Project")
    expect(page).to have_content("Welcome to the Volunteer and Project Tracker.")
  end
end
