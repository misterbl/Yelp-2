  feature  'restaurant management' do
    scenario 'show a restaurant' do
      Restaurant.create(name: 'Oi Hanoi', description: 'Now open tonight!')
      visit '/restaurants'
      click_link 'Show'
      expect(page).to have_content('Oi Hanoi')
      expect(page).to have_content('Now open tonight!')
    end
  end
