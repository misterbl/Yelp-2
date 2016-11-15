  feature  'reviews management' do
    scenario 'create a review' do
      Restaurant.create(name: 'Oi Hanoi', description: 'Now open in London tonight!')
      visit '/restaurants'
      click_link 'Show'
      save_and_open_page
      fill_in 'Reviewer', with: 'laurent@makers.com'
      fill_in 'Text', with: 'Best restaurant in town!'
      fill_in 'Rating', with: '5'
      click_button 'Create Review'

      expect(page).to have_content('laurent@makers.com')
      expect(page).to have_content('Best restaurant in town!')
      expect(page).to have_content('5')
    end
  end
