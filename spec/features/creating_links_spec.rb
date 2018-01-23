feature 'Creating New Links' do
  scenario 'user can add new links with address and title' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.lynda.com'
    fill_in 'title', with: 'Welcome to Lynda'
    click_button 'Add Link'
    expect(page).to have_content('Welcome to Lynda')
  end
end
