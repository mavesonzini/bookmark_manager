require './app/app.rb'

feature "Adding multiple tags to a link" do
before(:each) do
  visit '/links/signup'
  fill_in "email", with: "test@test.com"
  fill_in "password", with: "password"
  click_button "submit"
end
  scenario "User can add multiple tags to link" do
    visit '/links/new'
    fill_in "title", with: "Youtube"
    fill_in "url", with: "youtube.com"
    fill_in "tag", with: "videos, fun"
    click_button('Submit')

    link = Link.first
    expect(link.tags.map(&:name)).to include("videos", "fun")

  end
end
