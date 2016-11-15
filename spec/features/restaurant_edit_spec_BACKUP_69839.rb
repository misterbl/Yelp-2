  feature  'restaurant management' do
    scenario 'edit a restaurant' do
<<<<<<< HEAD
      Restaurant.create(name: 'Oi Hanoi', description: 'Now open tonight!')
      visit '/restaurants'
      click_link 'Edit'
      fill_in 'Name', with: 'Oi Hanoi'
      fill_in 'Description', with: 'Closed Down for good!!'
=======
      Restaurant.new(name: 'Oi Hanoi', description: 'Now open!')
      visit '/restaurants'
      click_link 'Edit'
      fill_in 'name', with: 'Oi Hanoi'
      fill_in 'description', with: 'Closed Down!!'
>>>>>>> master
      click_button 'Save Restaurant'

      expect(page).to have_content('Closed Down for good!!')
    end
  end
