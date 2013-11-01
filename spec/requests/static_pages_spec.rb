# Static Pages Spec
require 'spec_helper'

describe "Static pages" do

  pending "fill out test for static page rendering"

  # describe "Home page" do

  #   describe "for signed-in users" do

  #     let(:user) { FactoryGirl.create(:user) }
  #     before do
  #       FactoryGirl.create(:completion, user: user, milliseconds: 123_123)
  #       FactoryGirl.create(:completion, user: user, milliseconds: 321_321)
  #       sign_in user
  #       visit root_path
  #     end

  #     it "should render the user's feed" do
  #       user.feed.each do |item|
  #         expect(page).to have_selector("li##{item.id}", text: item.content)
  #       end
  #     end

  #     describe "follower/following counts" do
  #       let(:other_user) { FactoryGirl.create(:user, email: "other@user.com") }
  #       before do
  #         other_user.follow!(user)
  #         visit root_path
  #       end

  #       it { should have_link("0 following", href: following_user_path(user)) }
  #       it { should have_link("1 followers", href: followers_user_path(user)) }
  #     end
  #   end
  # end

end