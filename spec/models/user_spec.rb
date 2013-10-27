require 'spec_helper'
# __FILE__ lists the entire filepath of current file
describe User do

  before { @user = User.new(name:"Example user",email: "user@example.com",password:"password") }

  # make 'it' refer to @user
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:relationships) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end
end