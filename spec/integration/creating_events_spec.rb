require 'spec_helper'

feature 'Creating Events' do
  before do
    Factory(:user, :email => "spetry@gmail.com")
    visit '/'
    click_link "Add Event"
  end

  scenario "can create an event" do
    fill_in 'Title', :with => 'Shoot a commercial'
    click_button 'Create Event'
    page.should have_content('Event has been created.')
  end
end
