require 'spec_helper'

feature 'Signing up' do
  scenario 'Sucessful sign up' do
    visit '/'
    click_link 'Sign up'
    fill_in "Email", :with => "pbuns@gmail.com"
    fill_in "First name", :with => "Bonnibel"
    fill_in "Last name", :with => "Bubblegum"
    fill_in "Password", :with => "marcy123"
    fill_in "Password confirmation", :with => "marcy123"
    click_button "Sign up"
    page.should have_content("You have signed up successfully.")
  end
end
