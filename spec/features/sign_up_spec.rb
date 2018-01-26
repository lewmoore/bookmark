feature 'Signing Up' do

  scenario 'user sees sign in form on landing page' do
    sign_up

    expect(current_path).to eq '/links'

    expect(page).to have_content('Welcome lewis@gmail.com!')
  end

  scenario 'user count increases by 1 on sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'user count does not increase if password validation fails' do
    expect { bad_sign_up }.to_not change(User, :count)
  end

  scenario 'failing password validation redirects to sign up page' do
    bad_sign_up

    expect(current_path).to eq '/'
  end
end
