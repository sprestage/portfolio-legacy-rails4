require "test_helper"

feature "As a visitor, I want to sign up as a new user so I can create and edit content." do
  scenario "new account is successfully created from root_path" do
    # Given a completed new user form
    visit root_path
    click_on 'Sign Up'
    # When I submit the form with valid data
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    # Then I should see the new user created success message
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
  end

  scenario "new account is successfully created from new_user_registration_path" do
    # Given a completed new user form
    visit new_user_registration_path
    # When I submit the form with valid data
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    # Then I should see the new user created success message
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
  end

#NOTE: I cannot seem to get a sign up test to work with fixtures.  I can get fixtures to work w/ sign in & out.
  # scenario "new user is successfully created using fixtures from the new_user_registration_path" do
  #   # Given a completed new user form
  #   visit new_user_registration_path
  #   # click_on 'Sign Up'
  #   fill_in 'Email', with: users(:user_three).email
  #   fill_in 'Password', with: "password"  # NOTE: this gave me some trouble, since I tried to use fixtures here
  #   fill_in 'Password confirmation', with: "password"
  #   # When I submit the form
  #   click_on 'Sign up'
  #   # Then I should see the new user created success message
  #   page.text.must_include "Welcome! You have signed up successfully"
  #   page.wont_have_content "prohibited this user from being saved"
  # end

#NOTE: I cannot seem to get a sign up test to work with fixtures.  I can get fixtures to work w/ sign in & out.
  # scenario "new user is successfully created using fixtures from the root_path" do
  #   # Given a completed new user form
  #   visit root_path
  #   click_on 'Sign Up'
  #   fill_in 'Email', with: users(:user_one).email
  #   fill_in 'Password', with: "password"  # NOTE: this gave me some trouble, since I tried to use fixtures here
  #   fill_in 'Password confirmation', with: "password"
  #   # When I submit the form
  #   click_on 'Sign up'
  #   # Then I should see the new user created success message
  #   page.text.must_include "Welcome! You have signed up successfully"
  #   page.wont_have_content "prohibited this user from being saved"
  # end

#TODO: create test to check that a new user signing up also gets logged in automatically on successful create
  # scenario "new user is logged in automatically when successfully created" do
  #   # Given a completed new user form
  #   visit users_path
  #   click_on 'Sign Up'
  #   fill_in 'Email', with: 'user@example.com'
  #   fill_in 'Password', with: '1234'
  #   fill_in 'Password confirmation', with: '1234'
  #   # When I submit the form
  #   click_on 'Sign Up'
  #   # Then I should see the new user created success message
  #   page.must_have_content "Logged in as"
  # end
end
