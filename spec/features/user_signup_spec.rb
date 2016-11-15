feature 'users' do
  context 'sign up' do
    scenario 'be able to sign up' do
      sign_up
      expect(page).to have_content 'Welcome laurent'
    end
  end
end
