require 'spec_helper'

feature "Creating Links" do
    scenario "Creating a new link for the list" do
      visit("/links/new")
      fill_in :name, with: "Github"
      fill_in :url, with: "http://github.com"
      click_button 'Add Link'

    expect(current_path).to eq'/links'

    within 'ul#links' do
      expect(page).to have_content("Github")
    end
  end
end
