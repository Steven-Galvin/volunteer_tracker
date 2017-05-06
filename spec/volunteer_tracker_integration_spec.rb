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
