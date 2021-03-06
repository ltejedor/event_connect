require 'spec_helper'

feature "Editing Events" do
  before do
    Factory(:user, :email => "spetry@gmail.com")
    visit '/'
    click_link "Sign in"
    page.should have_content("Remember me")
    fill_in "Email", :with => "spetry@gmail.com"
    fill_in "Password", :with => "password123"
    click_button "Sign in now"
    click_link "Add Event for MRocker2004"
    fill_in 'Title', :with => 'wear the crown'
    click_button 'Create Event'
  end

  scenario "Updating an event" do
    visit "/"
    click_link "wear the crown"
    click_link "Edit Event"
    fill_in "Title", :with => "watch the throne"
    click_button "Update Event"
    page.should have_content("Event has been updated.")
  end
end
