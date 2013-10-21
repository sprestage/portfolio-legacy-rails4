require "test_helper"

feature "As the site owner, I want to delete a portfolio item so that I can keep the list focused on my best work" do

  scenario "works with valid data" do

    # Given valid existing projects
    visit projects_path

    # When I submit the form
    # page.find("tr:last").click_on "Destroy"
    page.first(:link, "Destroy").click
    # click_on 'Destroy'

    # Then I should receive a warning
    page.has_content?('Are you sure')

    # And the project is no longer present
    page.wont_have_content 'Geeky Mama Mare Blog Project'
    page.text.must_include 'The Unofficial Trakehner Database Project'

  end

end

