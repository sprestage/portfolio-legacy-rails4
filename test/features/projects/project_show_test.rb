require "test_helper"

feature "As the site owner, I want to show a single portfolio item so that I can see details of a single project" do
  scenario "show a single valid project" do
    # Given a valid project
    # When I visit the show page
    visit project_path(projects(:project01))     # or visit "/projects"

    # Then I should see my chosen project
    page.text.must_include 'Geeky Mama Mare Blog Project'
    page.wont_have_content 'The Unofficial Trakehner Database Project'
  end
end

