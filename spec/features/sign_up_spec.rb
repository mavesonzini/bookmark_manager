require 'spec_helper'

feature "sign up the webpage" do
  scenario "signing up" do
    sign_up
    expect(current_path).to include 'links'
  end

  scenario "should display a welcome message" do
    sign_up
    expect(page).to have_content "Welcome, test@test.com"
  end

  scenario "should increase by 1 the User count" do
    expect{user}.to change{User.count}.by 1
  end
end
