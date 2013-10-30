require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do

    describe "for signed-in users" do 
      let(:user) { User.create }
      before do
        c = Completion.create
        w = Wod.create
        c.wod_id = w.id
        c.milliseconds = 234394
        c.save
        user.completions << c
        user.save
        login_as user, scope: :user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("#{item.id}", text: item.content)
        end
      end
    end
  end

end