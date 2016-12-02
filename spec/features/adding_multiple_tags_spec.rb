require './app/app.rb'

feature "Adding multiple tags to a link" do

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
