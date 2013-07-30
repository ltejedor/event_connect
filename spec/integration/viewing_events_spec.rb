require 'spec_helper'

feature "Viewing events" do
  scenario "Listing all events" do
    event = Factory.create(:event, :title => "Write a rap song")
    visit '/'
    click_link 'Write a rap song'
    page.current_url.should == event_url(event)
  end
end
