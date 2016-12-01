def sign_up
  visit '/sign_up'
  fill_in "email", with: 'test@test.com'
  fill_in "password", with: 'TestPassword'
  click_button 'Sign up'
end
