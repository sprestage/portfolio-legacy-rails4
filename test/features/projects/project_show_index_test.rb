require "test_helper"

feature "As the site owner, I want to index the portfolio items so that I can see a list of all my work" do
  scenario "index of the valid projects" do
    # Given several valid projects
    # When I visit the show index page
    visit projects_path     # or visit "/projects"

    # Then I should see all the projects
    page.text.must_include 'Geeky Mama Mare Blog Project'
    page.text.must_include 'The Unofficial Trakehner Database Project'
  end
end


