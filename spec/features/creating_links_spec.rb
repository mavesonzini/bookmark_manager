require 'spec_helper'

feature 'create links' do

  scenario 'submit a new link' do
    visit '/links/new'
    fill_in 'URL', with: 'https://github.com'
    fill_in 'Title', with: 'Github'
    click_button 'Add'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Github')
    end
  end

end
