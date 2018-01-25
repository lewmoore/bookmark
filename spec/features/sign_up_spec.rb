feature 'Signing Up' do
  scenario 'user sees sign in form on landing page' do
    sign_up

    expect(current_path).to eq '/links'

    expect(page).to have_content('Welcome lewis@gmail.com!')
  end

  scenario 'user count increases by 1 on sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'user does not validate password' do
    def bad_sign_up
      visit('/')
      fill_in 'username', with: 'lewis@gmail.com'
      fill_in 'password', with: '123'
      fill_in 'password_confirmation', with: '234'
      click_button('Sign Up')
    end

    expect { bad_sign_up }.to_not change(User, :count)
  end
end
