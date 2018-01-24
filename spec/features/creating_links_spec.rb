feature 'Creating New Links' do
  scenario 'user can add new links with address and title' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.lynda.com'
    fill_in 'title', with: 'Welcome to Lynda'
    click_button 'Add Link'
    expect(page).to have_content('Welcome to Lynda')
  end

  scenario 'User can add tags to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.lynda.com'
    fill_in 'title', with: 'Welcome to Lynda'
    fill_in 'tags', with: 'Education'
    click_button 'Add Link'
    link = Link.first

    expect(link.tags.map(&:name)).to include('Education')
  end
end
