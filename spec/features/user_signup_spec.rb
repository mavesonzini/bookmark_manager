require './app/app'

feature 'user signup' do
  before(:each) do
    visit '/links/signup'
    fill_in "email", with: "test@test.com"
    fill_in "password", with: "password"
    click_button "submit"
  end

  scenario "User see welcome message in '/links'" do
    visit '/links'
    expect(page).to have_content("Welcome, test@test.com")
  end

  scenario "user count increses by 1" do
    user = User.all
    expect(user.count).to eq 1
  end
end
