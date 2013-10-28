require "test_helper"

feature "updating a post" do
  scenario "author can successfully update posts" do
    # Given a logged in author
    sign_in_author
    visit post_path(posts(:unPublishedPostByAuthor))
    # page.find("tr:last").click_on "Edit"
    click_on 'Edit'
    fill_in 'Title', with: "A different title"
    fill_in 'Content', with: "Different content"
    # When I click edit and submit changed data
    click_on 'Update Post'
    # Then I should see the updated post
    page.text.must_include "A different title"
    page.text.must_include "Different content"
    # And a success message
    page.text.must_include 'Post was successfully updated'
  end

  scenario "editor can successfully update posts" do
    # Given a logged in editor
    sign_in_editor
    visit post_path(posts(:unPublishedPostByEditor))
    # page.find("tr:last").click_on "Edit"
    click_on 'Edit'
    fill_in 'Title', with: "Another different title"
    fill_in 'Content', with: "More different content"
    # When I click edit and submit changed data
    click_on 'Update Post'
    # Then I should see the updated post
    page.text.must_include "Another different title"
    page.text.must_include "More different content"
    # And a success message
    page.text.must_include 'Post was successfully updated'
  end

  scenario "site visitor cannot update posts, ever" do
    # Given a site visitor (unauthenticated user), don't login
    # When I visit the posts page
    visit posts_path
    # Then I see no Edit buttons for any post
    page.wont_have_content 'Edit'
    visit post_path(posts(:publishedPostByAuthor))
    page.wont_have_content 'Edit'
  end

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
