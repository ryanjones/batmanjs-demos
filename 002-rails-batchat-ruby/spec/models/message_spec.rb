require 'spec_helper'

describe Message do
  it { should belong_to(:user) }
  it { should validate_presence_of(:content) }
end