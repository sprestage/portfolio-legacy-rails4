require "test_helper"

feature "Creating a post" do

  scenario "author can successfully create posts" do
    # Given a logged in author's completed new post form
    sign_in_author
    visit new_post_path
    fill_in "Title", with: posts(:post04).title
    fill_in "Content", with: posts(:post04).content
    # When the form is submitted
    click_on "Create Post"
    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:post04).title
    page.has_css? "#author_id"  #NOTE: this isn't enough by itself, since my Portfolio lists my name as author.
    page.text.must_include users(:author).email
  end

  scenario "editor can successfully create posts" do
    # Given a logged in editor's completed new post form
    sign_in_editor
    visit new_post_path
    fill_in "Title", with: posts(:post03).title
    fill_in "Content", with: posts(:post03).content
    # When the form is submitted
    click_on "Create Post"
    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:post03).title
    page.has_css? "#author_id"  #NOTE: this isn't enough by itself, since my Portfolio lists my name as author.
    page.text.must_include users(:editor).email
  end

  scenario "site visitor can NOT create posts" do
    # Given a site visitor (unauthenticated user), don't login
    # When the root or posts page is visited
    visit posts_path
    # Then there is no New Post button available
    page.wont_have_content "New Post"
  end

end







