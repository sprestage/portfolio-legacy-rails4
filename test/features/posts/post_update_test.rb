require "test_helper"

feature "updating a post" do
  scenario "works with valid data" do

    # Given an existing post
    sign_in
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:post02).title
    fill_in 'Content', with: posts(:post02).content
    click_on 'Create Post'
    click_on 'Edit'
    fill_in 'Title', with: posts(:post03).title
    fill_in 'Content', with: posts(:post03).content

    # When I click edit and submit changed data
    click_on 'Update Post'

    # Then I should see the updated post
    page.text.must_include posts(:post03).title
    page.text.must_include posts(:post03).content

    # And a success message
    page.text.must_include 'Post was successfully updated'

  end
end
