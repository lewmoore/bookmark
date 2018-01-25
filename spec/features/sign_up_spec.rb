feature 'Signing Up' do
  scenario 'user sees sign in form on landing page' do
    visit('/')
    fill_in 'username', with: 'lewis@gmail.com'
    fill_in 'password', with: '123'
    click_button('Sign Up')

    expect(current_path).to eq '/links'

    expect(page).to have_content('Welcome lewis@gmail.com!')
  end

  def sign_up
    visit('/')
    fill_in 'username', with: 'lewis@gmail.com'
    fill_in 'password', with: '123'
    click_button('Sign Up')
  end

  scenario 'user count increases by 1 on sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end
end
