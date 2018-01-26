def sign_up
  visit('/')
  fill_in 'username', with: 'lewis@gmail.com'
  fill_in 'password', with: '123'
  fill_in 'password_confirmation', with: '123'
  click_button('Sign Up')
end

def bad_sign_up
  visit('/')
  fill_in 'username', with: 'lewis@gmail.com'
  fill_in 'password', with: '123'
  fill_in 'password_confirmation', with: '234'
  click_button('Sign Up')
end
