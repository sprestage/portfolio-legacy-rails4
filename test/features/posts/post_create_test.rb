require "test_helper"

feature "Creating a post (using fixtures & faker)" do
  scenario "submit form data to create a new post using fixtures" do
    # Given a logged in user's completed new post form
    sign_in
    visit new_post_path
    fill_in "Title", with: posts(:post04).title
    fill_in "Content", with: posts(:post04).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:post04).title
    page.has_css? "#author_id"  #NOTE: this isn't enough by itself, since my Portfolio lists my name as author.
    page.text.must_include users(:user_one).email
  end
end







