# Completion Spec
require 'spec_helper'

describe Completion do

  let(:user) { FactoryGirl.create(:user, email: "completion@tester.com") }
  let(:wod) { FactoryGirl.create(:wod) }

  before do
    @completion = Completion.new(milliseconds: 123_321, user_id: user.id, wod_id: wod.id)
  end

  subject { @completion }

  it { should respond_to(:milliseconds) }
  it { should respond_to(:user_id) }
  it { should respond_to(:wod_id) }

end