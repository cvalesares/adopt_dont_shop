require 'rails_helper'

RSpec.describe 'new application' do
  before :each do
    @application1 = Application.create!(name: 'John Smith', street: '123 Main St', city: 'Tampa', state: 'FL', zip: 33602, description: "I'm cool")
  end

  it "shows the new application" do
    visit "/applications/#{@application1.id}"

    expect(page).to have_content(@application1.name)
    expect(page).to have_content(@application1.street)
    expect(page).to have_content(@application1.description)
    expect(page).to have_content(@application1.status)
  end

  it "has valdiated inputs" do
    visit "/applications/new"

    fill_in 'Name', with: 'Jon'
    fill_in 'Street', with: nil
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    click_button 'Save'

    expect(page).to have_content("Error:")
  end

  it "status is in progress by default" do
    visit "/applications/new"

    fill_in 'Name', with: 'Jon'
    fill_in 'Street', with: '123 Main St'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: 80202
    click_button 'Save'

    expect(page).to have_content("123 Main St")
    expect(page).to have_content("In Progress")
  end
end
