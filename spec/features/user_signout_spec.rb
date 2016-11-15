feature 'users' do
  context 'sign ouy' do
    scenario 'able to sign out' do
      sign_up
      click_link 'Sign out'
      expect(page).to have_content 'Successfully logged out!'
    end
  end
end
