require 'spec_helper'

feature "Editing Events" do
  scenario "Updating an event" do
    Factory(:event, :title => "Make ceramic cup to hold coffee")
    visit "/"
    click_link "Make ceramic cup to hold coffee"
    click_link "Edit Event"
    fill_in "Title", :with => "Make clay cup to hold tea"
    click_button "Update Event"
    page.should have_content("Event has been updated.")
  end
end
