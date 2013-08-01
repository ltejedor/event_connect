require 'spec_helper'

feature 'Creating Events' do
  before do
    Factory(:user, :email => "spetry@gmail.com")
    visit '/'
    click_link "Sign in"
    page.should have_content("Remember me")
    fill_in "Email", :with => "spetry@gmail.com"
    fill_in "Password", :with => "password123"
    click_button "Sign in now"
    page.should have_content("Signed in as MRocker2004")
    page.should have_content("Name: Marcy")

    click_button "Add event for MRocker2004"

  end

  scenario "can create an event" do
    fill_in 'Title', :with => 'Shoot a commercial'
    click_button 'Create Event'
    page.should have_content('Event has been created.')
  end
end
