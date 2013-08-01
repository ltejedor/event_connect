require 'spec_helper'


feature 'Signing in' do
before do
Factory(:user, :email => "spetry@gmail.com")
end
  scenario 'Signing in via form' do
    User.find_by_email('spetry@gmail.com')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "spetry@gmail.com"
    fill_in 'Password', :with => "password123"
    click_button "Sign in now"
    page.should have_content("Signed in successfully.")
  end
end
