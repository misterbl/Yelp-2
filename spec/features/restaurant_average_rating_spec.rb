feature  'restaurant management' do
  scenario 'see restaurants average rating' do
    Restaurant.create(name: 'Oi Hanoi', description: 'Now open tonight!')
    visit '/restaurants'
    click_link 'Show'
    fill_in 'Reviewer', with: 'Royston'
    fill_in 'Text', with: 'Great soup!!'
    fill_in 'Rating', with: 5
    click_button 'Create Review'

    expect(page).to have_content('Average Rating: 5.0')
  end
end
