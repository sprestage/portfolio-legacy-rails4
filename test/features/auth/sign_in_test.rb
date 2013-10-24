require "test_helper"

feature "As a visitor, I want to sign into my existing account." do
  scenario "existing account successfully logged in" do
    # Given an existing logged in user
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
    click_on 'Log Out'
    page.must_have_content "Signed out successfully"
    page.wont_have_content "Log Out"
    click_on 'Log In'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    # When I submit the form
    click_on 'Sign in'
    # Then I should receive a successful login message
    page.must_have_content "Signed in successfully"
    page.wont_have_content "Log In"
    page.wont_have_content "Invalid email or password"
  end
end
