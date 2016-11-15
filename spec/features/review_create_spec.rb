  feature  'reviews management' do
    scenario 'create a review' do
      Restaurant.new(name: 'Oi Hanoi', description: 'Now open in London tonight!')
      visit '/restaurants'
      click_link 'Show'
      fill_in 'Email', with: 'laurent@makers.com'
      fill_in 'Text', with: 'Best restaurant in town!'
      fill_in 'Rating', with: '5'
      click_button 'Create review'

      expect(page).to have_content('laurent@makers.com')
      expect(page).to have_content('Best restaurant in town!')
      expect(page).to have_content('5')
    end
  end
