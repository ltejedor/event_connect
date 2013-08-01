require 'spec_helper'

feature "User can only edit their account" do
  before do
  Factory(:user, :email => "spetry@gmail.com")
    visit '/'
    click_link "Sign in"
    page.should have_content("Remember me")
    fill_in "Email", :with => "spetry@gmail.com"
    fill_in "Password", :with => "password123"
    click_button "Sign in now"
  end

  scenario "Updating account" do
    visit "/"
    click_link "Marcy Hellbeast"
    click_link "Edit User"
    fill_in "Current password", :with => "password123"
    fill_in "Email", :with => "spetry1@gmail.com"
    click_button "Update"
    page.should have_content("You updated your account successfully")
  end

  scenario "Not being able to update if not that user" do
    visit "/"
    click_link "Sign out"
    click_link "Marcy Hellbeast"
    page.should have_content("Name: Marcy Hellbeast")
    page.should_not have_content("Edit User")
  end
end
