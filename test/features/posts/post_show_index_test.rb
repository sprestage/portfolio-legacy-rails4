require "test_helper"

feature "Show post index" do
  scenario "editor can successfully see all posts (published and unpublished) in the index" do
    # Given a logged in editor
    sign_in_editor
    # When I visit the posts path
    visit posts_path
    # Then I should see all published posts
    page.text.must_include posts(:publishedPostByAuthor).title
    page.text.must_include posts(:publishedPostByEditor).title
    # And all unpublished posts
    page.text.must_include posts(:unPublishedPostByAuthor).title
    page.text.must_include posts(:unPublishedPostByEditor).title
  end

  scenario "author can successfully see only their unpublished and any published posts in the index" do
    # Given a logged in author
    sign_in_author
    # When I visit the posts path
    visit posts_path
    # Then I should see all published posts
    page.text.must_include posts(:publishedPostByAuthor).title
    page.text.must_include posts(:publishedPostByEditor).title
    # And my unpublished posts
    page.text.must_include posts(:unPublishedPostByAuthor).title
    # But no unpublished posts that aren't mine
    page.wont_have_content posts(:unPublishedPostByEditor).title
  end

  scenario "site visitor can only see the index of published posts" do
    # Given a site visitor (unauthenticated user), don't login
    # When I visit the posts path
    visit posts_path
    # Then I should see all published posts
    page.text.must_include posts(:publishedPostByAuthor).title
    page.text.must_include posts(:publishedPostByEditor).title
    # But no unpublished posts
    page.wont_have_content posts(:unPublishedPostByAuthor).title
    page.wont_have_content posts(:unPublishedPostByEditor).title
  end

  scenario "editor can follow link for published post in the index" do
    # Given a logged in editor
    sign_in_editor
    visit posts_path
    page.text.must_include posts(:publishedPostByAuthor).title
    # When I click on someone else's published post
    page.find(:xpath, '//*[@id="post_270183853"]').click_on "Show"
    # Then I should see that post's show page
    page.text.must_include "Content:"
    page.text.must_include "Author:"
  end

  scenario "editor can go to show page for published post" do
    # Given a logged in editor
    sign_in_editor
    # When I visit the show page for someone else's published post
    visit post_path(posts(:publishedPostByAuthor))
    # Then I should see that post's show page
    page.text.must_include "Content:"
    page.text.must_include "Author:"
  end

end

