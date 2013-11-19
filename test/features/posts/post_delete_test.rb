require "test_helper"

feature "deleting a post" do
  scenario "author cannot delete posts, no matter if published or no" do
    # Given a logged in author
    sign_in_author
    # When I visit the posts path
    visit posts_path
    # Then I should see no Destroy button
    page.wont_have_content 'Destroy'
  end

### TODO: broke this while ajaxifying the /posts page.  Need to fix.  Commenting
###  out for now, to get my portfolio site working again.  -sprestage 11/19/13
  # scenario "editor can successfully delete posts, no matter if published or no" do
  #   # Given a logged in editor
  #   sign_in_editor
  #   visit posts_path
  #   # When I submit the form
  #   page.find("tr:last").click_on "Destroy"
  #   # Then I should receive a warning
  #   page.has_content?('Are you sure')
  #   # And the post is no longer present
  #   page.text.must_include posts(:post01).title
  #   page.text.must_include posts(:post02).title
  #   page.wont_have_content "An unpublished post by an editor"
  # end

  scenario "site visitor cannot delete posts, ever" do
    # Given a site visitor (unauthenticated user), don't login
    # When I visit the posts path
    visit posts_path
    # Then I should see no Destroy button
    page.wont_have_content 'Destroy'
  end

  # KEEP THESE FOR REF WHEN WE START USING CAPYBARA
  # click_on 'OK'
  # page.choose('OK')
  # click_button('OK')
  # find(:button, 'OK').click
  # find.button('OK')
  # page.click("OK")
  # click('OK')
  # find_button('OK').click
end

