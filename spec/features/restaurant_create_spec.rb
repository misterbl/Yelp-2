feature  'restaurant management' do
  scenario 'create a restaurant' do
    visit '/restaurants'
    click_button 'Create a new restaurant'
    fill_in 'Name', with: 'Oi Hanoi'
    fill_in 'Description', with: 'Grand opening tonight!!'
    click_button 'Save Restaurant'

    expect(page).to have_content('Name: Oi Hanoi')
  end
end
