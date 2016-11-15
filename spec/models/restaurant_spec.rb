require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Restaurant do
  it 'has a name' do
    restaurant = Restaurant.new(name: 'Oi Hanoi', description: 'Now open!')
    expect(restaurant.name).to eq('Oi Hanoi')
  end

    it 'has a description' do
      restaurant = Restaurant.new(name: 'Oi Hanoi', description: 'Now open!')
      expect(restaurant.description).to eq('Now open!')
    end
end
