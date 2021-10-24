require 'rails_helper'

RSpec.describe 'the application show' do
  before :each do
    @shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    @application1 = Application.create!(name: 'John Smith', address: '123 Main St. Denver, CO 80202', description: "I'm cool", status: '')
    @pet1 = @application1.pets.create!(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true, shelter_id: @shelter.id)
    @pet2 = @application1.pets.create!(name: 'Rover', age: 3, breed: 'Pitbull', adoptable: true, shelter_id: @shelter.id)
  end

  it "shows the application and all it's attributes" do
    visit "/applications/#{@application1.id}"

    expect(page).to have_content(@application1.name)
    expect(page).to have_content(@application1.address)
    expect(page).to have_content(@application1.description)
    expect(page).to have_content(@application1.status)
  end
end

# As a visitor
# When I visit an applications show page
# Then I can see the following:
#
# Name of the Applicant
# Full Address of the Applicant including street address, city, state, and zip code
# Description of why the applicant says they'd be a good home for this pet(s)
# names of all pets that this application is for (all names of pets should be links to their show page)
# The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
