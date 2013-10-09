require "test_helper"

feature "creating a post" do
  scenario "works with valid data" do
    #clicks a button that says create new post
    #page should have a form with fields
    #put some data in
    #click a button that says submit
    #then a user should see a success message
    #and the post they just created

    # Given a completed post form
    visit posts_path      # or visit "/posts"
    click_on "New Post"
    fill_in 'Title', with: 'example title of post'
    fill_in 'Content', with: 'example text of post'

    # When I submit the form
    click_on 'Create Post'

    # Then I should see the new post
    page.text.must_include 'example title of post'
    page.text.must_include 'example text of post'

    # And a success message
    page.text.must_include 'Post was successfully created'

  end
end
