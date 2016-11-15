  feature  'reviews management' do
    scenario 'create a restaurant' do
      Restaurant.new(name: 'Oi Hanoi', description: 'Now open tonight!')
      visit '/restaurants'
      click_link 'Show'
      click_link 'Create a new review'
      fill_in 'Text', with: 'Best restaurant in town!'
      fill_in 'Rating', with: '5'
      click_button 'Save review'

      expect(page).to have_content('Best restaurant in town!')
    end
  end
