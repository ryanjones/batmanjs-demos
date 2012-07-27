require 'spec_helper'

describe Message do

  specify { FactoryGirl.build(:message).should be_valid }

  it { should belong_to(:user) }
  it { should validate_presence_of(:content) }
end