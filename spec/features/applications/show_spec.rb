require 'rails_helper'

RSpec.describe 'the application show' do
  before :each do
    @shelter = Shelter.create!(name: 'Mystery Building', city: 'Irvine CA', foster_program: false, rank: 9)
    @application1 = Application.create!(name: 'John Smith', street: '123 Main St', city: 'Tampa', state: 'FL', zip: 33602, description: "I'm cool")
    @pet1 = @application1.pets.create!(name: 'Scooby', age: 2, breed: 'Great Dane', adoptable: true, shelter_id: @shelter.id)
    @pet2 = @application1.pets.create!(name: 'Rover', age: 3, breed: 'Pitbull', adoptable: true, shelter_id: @shelter.id)
  end

  it "shows the application and all it's attributes" do
    visit "/applications/#{@application1.id}"

    expect(page).to have_content(@application1.name)
    expect(page).to have_content(@application1.street)
    expect(page).to have_content(@application1.city)
    expect(page).to have_content(@application1.state)
    expect(page).to have_content(@application1.zip)
    expect(page).to have_content(@application1.description)
    expect(page).to have_content(@application1.status)
  end
end
