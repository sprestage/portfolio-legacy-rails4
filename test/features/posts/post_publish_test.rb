require "test_helper"

feature "publish a post" do
  scenario "editor can successfully publish a post" do
    skip
    # Given a site visitor, I should not see the unpublished post
    visit posts_path
    page.wont_have_content posts(:unPublishedPostByAuthor).title
    # When I publish the post (when logged in as editor)
    sign_in_editor
    visit posts_path
    page.text.must_include posts(:unPublishedPostByAuthor).title
    page.find(:xpath, '//*[@id="post_543653019"]').click_on "Publish"
    # Then log out as editor
    sign_out
    # And the post is now visible to the site visitor
    visit posts_path
    page.text.must_include posts(:unPublishedPostByAuthor).title
  end

end
