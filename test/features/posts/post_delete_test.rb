require "test_helper"

feature "deleting a post" do
  scenario "works with valid data" do

    # Given a completed edit form
    sign_in
    visit posts_path

    # When I submit the form
    page.find("tr:last").click_on "Destroy"

    # Then I should receive a warning
    page.has_content?('Are you sure')

    # KEEP THESE FOR REF WHEN WE START USING CAPYBARA
    # click_on 'OK'
    # page.choose('OK')
    # click_button('OK')
    # find(:button, 'OK').click
    # find.button('OK')
    # page.click("OK")
    # click('OK')
    # find_button('OK').click

    # And the post is no longer present
    # TODO: This won't check for anything meaningful.  Rewrite the final checking.
    page.text.must_include 'November 2012'
    page.text.must_include 'April 24-27 2013 - NorWesCon'
    page.wont_have_content 'GeekGirlCon'

  end
end

