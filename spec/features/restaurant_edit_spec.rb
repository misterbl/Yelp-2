  feature  'restaurant management' do
    scenario 'edit a restaurant' do
      Restaurant.create(name: 'Oi Hanoi', description: 'Now open!')
      visit '/restaurants'
      click_link 'Edit'
      fill_in 'name', with: 'Oi Hanoi'
      fill_in 'description', with: 'Closed Down!!'

      expect(page).to have_content('Closed Down!!')
    end
  end
