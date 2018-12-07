require "rails_helper"

RSpec.feature "New", :type => :feature do
 # happy path
 scenario "User creates a new account with valid details" do
   visit "/sign_up"
   fill_in "user[first_name]", :with => "sam"
   fill_in "user[last_name]", :with => "smith"
   fill_in "user[email]", :with => "sam@gmail.com"
   fill_in "user[password]", :with => "testing12"
   click_button "Create user"
   expect(page).to have_text("login | Signup | Sign in with Google")
 end
 # unhappy path
 scenario "User creates a new account with invalid email" do
   visit "/sign_up"
   fill_in "user[first_name]", :with => "sam"
   fill_in "user[last_name]", :with => "smith"
   fill_in "user[email]", :with => "sam"
   fill_in "user[password]", :with => "testing12"
   click_button "Create user"
   expect(page).to have_text("Signup!")
 end
end