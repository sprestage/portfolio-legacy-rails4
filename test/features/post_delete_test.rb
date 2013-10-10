require "test_helper"

feature "deleting a post" do
  scenario "works with valid data" do

    # Given a completed edit form
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:post01).title
    fill_in 'Content', with: posts(:post01).content
    click_on 'Create Post'
    click_on 'Back'

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
    page.wont_have_content 'post to be deleted'

  end
end

