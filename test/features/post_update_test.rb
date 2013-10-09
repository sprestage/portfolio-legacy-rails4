require "test_helper"

# feature "PostUpdate" do
#   scenario "the test is sound" do
#     visit root_path
#     page.must_have_content "Hello World"
#     page.wont_have_content "Goobye All!"
#   end
# end

feature "updating a post" do
  scenario "works with valid data" do
    #page displays all posts
    #clicks a button that says Edit next to post of choice
    #page should have a form with pre-populated fields containing existing post data
    #alter the data
    #click a button that says Update Post
    #then user should see a success message
    #and the post they just modified

    # Given a completed edit form
    visit posts_path
    click_on "New Post"
    fill_in 'Title', with: 'example title of another post'
    fill_in 'Content', with: 'example text of another post'
    click_on 'Create Post'
    click_on "Edit"
    fill_in 'Title', with: 'updated title of post'
    fill_in 'Content', with: 'updated text of post'

    # When I submit the form
    click_on 'Update Post'

    # Then I should see the updated post
    page.text.must_include 'updated title of post'
    page.text.must_include 'updated text of post'

    # And a success message
    page.text.must_include 'Post was successfully updated'

  end
end
