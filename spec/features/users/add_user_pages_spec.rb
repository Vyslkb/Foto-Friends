require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit root_path
    click_on 'Add a new profile'
    fill_in 'Name', :with => 'Kathy'
    fill_in 'Email', :with => 'kathy@aol.com'
  fill_in 'Email', :with => 'kathy@aol.com'
  fill_in 'Email', :with => 'kathy@aol.com'

    click_on 'Create Section'
    expect(page).to have_content 'Sections'
  end

  it "gives error when no name is entered" do
    visit root_path
    click_on 'Add a new section'
    click_on 'Create Section'
    expect(page).to have_content 'errors'
  end
end
