require "test_helper"

feature "As a visitor, I want to sign out when I'm done." do
  scenario "signed in user is successfully signed out" do
    # Given a user is logged in
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
    # When I click log out.
    click_on 'Sign Out'
    # Then I should see the logged out message
    page.text.must_include "Signed out successfully"
    page.wont_have_content "Sign Out"
  end

  scenario "signed in user is successfully signed out using fixtures" do
    # Given a user is logged in
    visit new_user_session_path
    fill_in 'Email', with: users(:user_one).email
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    page.text.must_include "Signed in successfully"
    page.wont_have_content "Invalid email or password"
    # When I click log out.
    click_on 'Sign Out'
    # Then I should see the logged out message
    page.text.must_include "Signed out successfully"
    page.wont_have_content "Sign Out"
  end

end
