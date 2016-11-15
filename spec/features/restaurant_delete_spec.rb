require 'rails_helper'

feature 'restaurant management' do
  scenario 'delete a restaurant' do
    Restaurant.create(name: 'Oi Hanoi', description: 'Now open tonight!')
    visit '/restaurants'
    click_link 'Delete'
    expect(page).not_to have_content 'Oi Hanoi'
  end
end
