require './app/app'

feature 'filtering links by tags' do
  before(:each) do
      Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
      Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
      Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
      Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    end

  scenario 'returns a filtered list of URLs based on topic' do

    visit '/tags/bubbles'

    expect(page).to have_content('This is Zombocom')
    expect(page).to have_content('Bubble Bobble')
    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('Google')


  end

end
