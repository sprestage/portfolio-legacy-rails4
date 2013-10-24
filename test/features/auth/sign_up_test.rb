require "test_helper"

feature "As a site owner, I want to sign up a new user" do
  scenario "new user is successfully created" do
    # Given a completed new user form
    visit root_path
    click_on 'Sign Up'
    # When I submit the form with valid data
    # fill_in 'Email', with: 'user@example.com'
    # fill_in 'Password', with: '12341234'
    click_on 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '12341234'
    fill_in 'Password confirmation', with: '12341234'
    click_on 'Sign up'
    # Then I should see the new user created success message
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
  end

  # scenario "new user is successfully created using faker" do
  #   # Given a completed new user form
  #   visit new_user_registration_path
  #   click_on 'Sign Up'
  #   fill_in 'Email', with: users(:user01).email
  #   fill_in 'Password', with: users(:user01).encrypted_password
  #   # fill_in 'Password confirmation', with: users(:user01).password_confirmation
  #   # When I submit the form
  #   click_on 'Sign up'
  #   # Then I should see the new user created success message
  #   page.must_have_content "Welcome! You have signed up successfully"
  # end

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
