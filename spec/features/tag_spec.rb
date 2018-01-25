feature 'Tags' do
  scenario 'User can add tags to a new link' do
    sign_up
    visit '/links/new'
    fill_in 'url', with: 'http://www.lynda.com'
    fill_in 'title', with: 'Welcome to Lynda'
    fill_in 'tags', with: 'Education'
    click_button 'Add Link'
    link = Link.first

    expect(link.tags.map(&:name)).to include('Education')
  end

  scenario 'display links with bubbles tag only' do
    sign_up

    visit('links/new')
    fill_in 'url', with: 'www.coinbase.co.uk'
    fill_in 'title', with: 'Coinbase'
    fill_in 'tags', with: 'Exchange'
    click_button 'Add Link'

    visit('links/new')
    fill_in 'url', with: 'www.bitstamp.com'
    fill_in 'title', with: 'Bitstamp'
    fill_in 'tags', with: 'Exchange'
    click_button 'Add Link'

    visit('links/new')
    fill_in 'url', with: 'www.soapywater.com'
    fill_in 'title', with: 'Whats this site?'
    fill_in 'tags', with: 'bubbles'
    click_button 'Add Link'

    visit('/tags/bubbles')
    expect(page).to have_content 'Whats this site?'
    expect(page).not_to have_content 'Coinbase'
    expect(page).not_to have_content 'Bitstamp'
  end

  scenario 'create a new link and assign it two tags' do
    sign_up
    visit('/links/new')
    fill_in 'url', with: 'www.makersacademy.com'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags', with: 'education coding'

    click_button ('Add Link')

    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'coding')
  end
end
