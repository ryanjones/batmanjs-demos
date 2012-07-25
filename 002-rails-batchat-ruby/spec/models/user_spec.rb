require 'spec_helper'

describe User do
  before do (:each)
    @user = FactoryGirl.build(:user)
  end

  it { should have_many(:messages) }
  it { should validate_presence_of(:name) }

  specify { @user.should be_valid }

  describe "expiry" do
    it "should not happen" do
      User.stub!(:where) { [] }
      User.should_receive(:where) { [] }

      User.check_expiry
    end

    it "should happen" do
      @user.stub!(:save) { true }
      User.stub!(:where) { [@user] }

      User.check_expiry

      @user.logged_in.should == false
    end

  end
end