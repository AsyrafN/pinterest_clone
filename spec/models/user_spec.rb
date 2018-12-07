require 'rails_helper'

RSpec.describe User, type: :model do
 context "validations" do

   it "should contain first name, last name and email" do
     should have_db_column(:first_name).of_type(:string)
     should have_db_column(:last_name).of_type(:string)
     should have_db_column(:email).of_type(:string)
   end

   describe "validates the presence of the attributes" do
     it { is_expected.to validate_presence_of(:email) }
     it { is_expected.to validate_presence_of(:first_name) }
     it { is_expected.to validate_presence_of(:last_name) }

   end

   context "associations" do
     it { is_expected.to have_many(:posts) }
     it { is_expected.to have_many(:authentications).dependent(:destroy) }
   end
 end

 #custom model test for user full name
   context "full_name" do

    it "should have combination of first and last name" do
     @user = User.create(first_name: "bob", last_name: "smith", email: "bobsmith@gmail.com", password: "testing12")
     full_name = User.create(first_name: "bob", last_name: "smith")
     expect(@user.full_name).to eq("bob smith")
    end
  end
end