require "test_helper"

feature "As the site owner, I want to edit a portfolio item so that I can correct typos" do
  scenario "edit an existing project" do

    # Given an existing project
    visit edit_project_path(projects(:project01))     # or visit "/projects"

    # When I make changes
    fill_in 'Name', with: projects(:project02).name
    click_on 'Update Project'

    # Then I should see the updated project
    page.text.must_include projects(:project02).name
    page.text.must_include projects(:project01).technologies_used

    # And a success message
    page.text.must_include 'Project was successfully updated.'

  end

  scenario "incorrectly editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:project02))

    # When I submit invalid changes
    fill_in "Name", with: "Err"
    click_on "Update Project"

    # Then the changes should not be saved, and I should get to try again
    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end

end
