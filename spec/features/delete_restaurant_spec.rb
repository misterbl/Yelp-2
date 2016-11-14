feature  'restaurant management' do
  scenario 'delete a restaurant' do
    Restaurant.create(name: 'Oi Hanoi', description: 'Now open!')
    visit '/restaurants'
    click_link 'Delete'
    click_button 'OK'


    expect(page).to have_content('Oi Hanoi')
  end
end
