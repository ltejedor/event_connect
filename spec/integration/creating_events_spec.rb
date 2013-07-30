require 'spec_helper'

feature 'Creating Events' do
  scenario "can create an event" do
    visit '/'
    click_link 'New Event'
    fill_in 'Title', :with => 'Shoot a commercial'
    click_button 'Create Event'
    page.should have_content('Event has been created.')
  end
end
