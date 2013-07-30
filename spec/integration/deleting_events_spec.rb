require 'spec_helper'

feature "Deleting events" do
  scenario "Deleting an event" do
    Factory(:event, :title => "Exterminate")
    visit "/"
    click_link "Exterminate"
    click_link "Delete Event"
    page.should have_content("Event has been deleted.")

    visit "/"
    page.should_not have_content("Exterminate")
  end
end
