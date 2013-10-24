require "test_helper"

feature "As a site owner, I want to sign out a user" do
  scenario "signed in user is successfully signed out" do
    # Given a user is logged in
    visit root_path
    click_on 'Sign Up'
    # fill_in 'Email', with: 'user@example.com'
    # fill_in 'Password', with: '12341234'
    click_on 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
    # When I click log out.
    click_on 'Log Out'
    # Then I should see the logged out message
    page.must_have_content "Signed out successfully"
    page.wont_have_content "Log Out"
  end
end
