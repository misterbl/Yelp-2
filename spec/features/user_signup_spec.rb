feature 'users' do
  context 'sign up' do
    scenario 'be able to sign up' do
      visit '/users/new'
      fill_in 'Username', with: "laurent"
      fill_in 'Email', with: 'laurent@makers.com'
      fill_in 'Password', with: '1234'
      click_button "Save User"
      expect(page).to have_content 'Welcome laurent'
    end
  end
end
