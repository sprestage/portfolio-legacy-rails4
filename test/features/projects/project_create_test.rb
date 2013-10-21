require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "create a project" do

    # Given a completed project form
    visit projects_path     # or visit "/projects"
    click_on 'New Project'
    fill_in 'Name', with: 'Geeky Mama Mare Blog'
    fill_in 'Technologies used', with: 'Rails, Ruby, Bootstrap, HTML5, CSS3'

    # When I submit the form
    click_on 'Create Project'

    # Then I should see the new project
    page.text.must_include 'Geeky Mama Mare Blog'
    page.text.must_include 'Ruby'

    # And a success message
    page.text.must_include 'Project was successfully created.'

  end
end

