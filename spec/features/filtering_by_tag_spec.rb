require 'spec_helper'

feature 'filter by tag' do
  scenario "filter link by tag 'bubbles'" do
    visit("/links/new")
    fill_in :name, with: "Github"
    fill_in :url, with: "http://github.com"
    fill_in :tags, with: "bubbles"
    click_button 'Add Link'
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content("Github")
    end
  end

  scenario "don't return links that don't have tag'bubbles'" do
    visit("/links/new")
    fill_in :name, with: "Google"
    fill_in :url, with: "http://google.com"
    fill_in :tags, with: "animal"
    click_button 'Add Link'
    visit '/tags/bubbles'
    expect(page).not_to have_content("Google")
  end
end
