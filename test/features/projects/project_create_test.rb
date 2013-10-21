require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "create a project with valid data" do

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

  # scenario "try to follow a bad pathname" do

  #   # Given a bad pathname
  #   bad_path = '/bad_pathname'

  #   # When I visit the bad path
  #   visit bad_path

  #   # Then I should see ...?
  #   page.text.must_include "No route matches"

  # end

#TODO: Get create project with invalid data test working correctly.  Somehow the expected errors are not displayed on page.
  # scenario "create project with invalid data" do

  #   # Given a new project has invalid data in form
  #   visit new_project_path
  #   fill_in 'Name', with: 'G'

  #   # When I submit the form with short name and missing technologies data
  #   click_on 'Create Project'

  #   # Then the form should be displayed again, with an error message.
  #   current_path.must_match /projects$/
  #   page.text.must_include 'prohibited'

  #   # And reasons why listed next to each field.
  #   page.text.must_include 'Name is too short'
  #   page.text.must_include "Technologies used can't be blank"

  # end

end

