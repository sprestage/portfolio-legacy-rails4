require "test_helper"

#NOTE: This isn't a good way to write the test.  This drives the test, step by step,
#   needlessly.  Keeping this in place to remind me so I can learn to use
#   fixtures instead.
feature "creating a post" do
  scenario "works with valid data" do

    # Given a completed post form
    visit posts_path      # or visit "/posts"
    click_on 'New Post'
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

# Here is the good way to write the Create Post test
feature "Creating a post (using fixtures)" do
  scenario "submit form data to create a new post using fixtures" do
    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:post01).title
    fill_in "Content", with: posts(:post01).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:post01).title
  end
end

feature "Creating a post (using fixtures & faker)" do
  scenario "submit form data to create a new post using fixtures" do
    # Given a logged in user's completed new post form
    visit new_user_session_path
    fill_in 'Email', with: users(:user_one).email
    fill_in 'Password', with: "password"
    click_on 'Sign in'
    page.must_have_content "Signed in successfully"
    page.wont_have_content "Log In"
    page.wont_have_content "Invalid email or password"
    visit new_post_path
    fill_in "Title", with: posts(:post04).title
    fill_in "Content", with: posts(:post04).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:post04).title
    page.has_css? "#author"  #NOTE: this isn't enough by itself, since my Portfolio lists my name as author.
    page.text.must_include users(:user_one).email
  end
end







