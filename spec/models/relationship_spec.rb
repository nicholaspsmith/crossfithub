# Relationship Spec
require 'spec_helper'

describe Relationship do
  # follower = nicole
  let(:follower) { FactoryGirl.create(:user, email: "follower@spec.com") }

  # followed_user = nick
  let(:followed) { FactoryGirl.create(:user, email: "followeduser@spec.com") }

  # nicole follows nick
  let(:relationship) { follower.relationships.build(followed: followed) }

  subject { relationship }

  it { should be_valid }

  describe "follower methods" do 
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end
end