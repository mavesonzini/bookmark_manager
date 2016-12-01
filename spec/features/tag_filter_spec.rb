require './app/app'

feature 'filtering links by tags' do

  scenario 'returns a filtered list of URLs based on topic' do

    visit '/links/new'
    fill_in "title", with: "BBC"
    fill_in "url", with: "youtube.com"
    fill_in "tag", with: "Bubbles"
    click_button('Submit')


    visit '/tags/bubbles'

    within "ul#tags" do
      expect(page).to have_content("Bubbles")
    end

  end

end
