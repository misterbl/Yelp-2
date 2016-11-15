require 'rails_helper'

feature 'restaurants' do
  context 'the list is empty' do
    scenario 'should display a link for adding a new restaurant' do
      Restaurant.create(name: 'Oi Hanoi', description: 'New restaurant now open!')
      visit '/restaurants'
      expect(page).to have_button 'Create a new restaurant'
    end
  end
end
