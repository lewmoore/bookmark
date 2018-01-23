feature 'Opening homepage' do
  scenario 'homepage displays welcome text' do
    visit('/')
    expect(page).to have_content('Welcome to Bookmark Manager!')
  end
end


feature 'viewing bookmarked links' do
  scenario 'user can see the bookmarks' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/links')
    expect(page).to have_content('Makers Academy')
  end
end
