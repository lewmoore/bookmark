feature 'Sorting links' do
  scenario 'display links with bubbles tag only' do

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
end
