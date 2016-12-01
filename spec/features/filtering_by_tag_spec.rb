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

end
