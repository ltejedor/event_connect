require 'spec_helper'

feature 'Creating Events' do
  scenario "can create an event" do
    visit '/'
    click_link 'New Event'
    fill_in 'Title', :with => 'Shoot a commercial'
    click_button 'Create Event'
    page.should have_content('Event has been created.')
    event = Event.find_by_title("Shoot a commercial")
    page.current_url.should == event_url(event)
    title = "Shoot a commercial - Events - EventConnect"
    find("title").should have_content(title)
  end
end
