feature 'users' do
  context 'sign in' do
    scenario 'able to sign in' do
      sign_up
      click_link 'Sign out'
      visit '/login'
      fill_in 'Email', with: 'laurent@makers.com'
      fill_in 'Password', with: '123456'
      click_button "Log in"
      expect(page).to have_content 'Successfully logged in!'
    end
  end
end
