require 'rails_helper'

RSpec.describe Post, type: :model do

  it "if search with valid keyword" do

    @user = User.create(first_name: "bob", last_name: "smitch", email: "bob@gmail.com", password: "testing12")
    @post = Post.create(caption: "Car", user_id: @user.id)
    @result = Post.search_by_posts("Car")
    expect(@result.first.caption).to eq("Car")
  end
  it "if search with invalid keyword" do

    @user = User.create(first_name: "bob", last_name: "smitch", email: "bob@gmail.com", password: "testing12")
    @post = Post.create(caption: "car", user_id: @user.id)
    @result = Post.search_by_posts("wakakaka")
    expect(@result.any?).to eq(false)
  end
end
