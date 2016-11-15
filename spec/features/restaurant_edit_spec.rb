  feature  'restaurant management' do
    scenario 'edit a restaurant' do
      Restaurant.create(name: 'Oi Hanoi', description: 'Now open tonight!')
      visit '/restaurants'
      click_link 'Edit'
      save_and_open_page
      fill_in 'Name', with: 'Oi Hanoi'
      fill_in 'Description', with: 'Closed Down for good!!'
      click_button 'Save Restaurant'

      expect(page).to have_content('Closed Down for good!!')
    end
  end
