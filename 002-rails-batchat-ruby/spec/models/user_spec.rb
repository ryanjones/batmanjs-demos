require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it { should have_many(:messages) }
  it { should validate_presence_of(:name) }

  specify { user.should be_valid }

  describe ".check_expiry" do
    context "records" do
      it "should not expire" do
        User.stub!(:where) { [] }
        User.should_receive(:where) { [] }

        User.check_expiry
      end

      it "should expire" do
        user.stub!(:save!) { true }
        User.stub!(:where) { [user] }

        User.check_expiry

        user.logged_in.should == false
      end
    end
  end
end