require 'spec_helper'

feature 'filter by tag' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', name: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', name: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', name: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', name: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario "filter link by tag 'bubbles'" do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)

    within 'ul#links' do

     expect(page).not_to have_content('Makers Academy')
     expect(page).not_to have_content('Code.org')
     expect(page).to have_content('This is Zombocom')
     expect(page).to have_content('Bubble Bobble')
    end
  end

  # scenario "don't return links that don't have tag'bubbles'" do
  #   visit("/links/new")
  #   fill_in :name, with: "Google"
  #   fill_in :url, with: "http://google.com"
  #   fill_in :tags, with: "animal"
  #   click_button 'Add Link'
  #   visit '/tags/bubbles'
  #   expect(page).not_to have_content("Google")
  # end
end
