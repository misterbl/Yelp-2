require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end

def sign_up
  visit '/users/new'
  fill_in 'Username', with: "laurent"
  fill_in 'Email', with: 'laurent@makers.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
  click_button "Save User"
end
