require 'rails_helper'

feature "User management" do
  scenario "has a user signup, login, logout cycle" do
    visit new_user_path
    expect{
      fill_in 'Email', with: "clifton@netscape.net"
      fill_in 'Password', with: "bacon"
      fill_in 'Password confirmation', with: "bacon"
      click_button 'Create User'
    }.to change(User, :count).by 1
    test_guy = User.all.last
    expect(current_path).to eq user_path(test_guy)
    expect(page).to have_content @user

    click_button "Log Out"
    expect(page).to have_content 'Log In'

    fill_in 'Email', with: "bogus@bad.net"
    click_button "Log In"
    expect(page).to have_button'Log In'
  end

  scenario "logs an existing user in" do
    test_lady = User.create(email:"jane@example.com", password:"racecars")
    visit login_path
    fill_in 'Email', with: test_lady.email
    fill_in 'Password', with: "racecars"
    click_button "Log In"
    expect(page).to have_button "Log Out"
  end
end
