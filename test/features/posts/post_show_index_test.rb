require "test_helper"

feature "Show post index" do
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
    page.text.must_include "foo"
    page.wont_have_content posts(:unPublishedPostByEditor).title
  end

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
    page.text.must_include "foo"
  end

  scenario "site visitor can only see the index of published posts" do
    # Given a site visitor (unauthenticated user), don't login
    # When I visit the posts path
    visit posts_path
    # Then I should see all published posts
    page.text.must_include posts(:publishedPostByAuthor).title
    page.text.must_include posts(:publishedPostByEditor).title
    # But no unpublished posts
    page.text.must_include "foo"
    page.wont_have_content posts(:unPublishedPostByAuthor).title
    page.wont_have_content posts(:unPublishedPostByEditor).title
  end
end

