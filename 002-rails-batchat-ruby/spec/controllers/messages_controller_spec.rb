require 'spec_helper'

describe MessagesController do
  before do (:each)
    @message = FactoryGirl.build(:message)
  end

  describe "index" do
    it "should retrieve all of the messages" do
      Message.stub!(:last) { @message }

      get :index, :format => :json

      response.should be_success
      ActiveSupport::JSON.decode(response.body).should == @message.as_json({:root => true, :only => [ :id, :content ]})
    end
  end


  describe "create" do
    before(:each) do
      @attr = FactoryGirl.attributes_for(:message)
    end

    it "passes" do
      Message.stub!(:save) { true }

      post :create, :message => @attr, :format => :json

      response.should be_success
    end

    it "fails" do
      Message.stub!(:save) { true }
      @attr.delete(:content)

      post :create, :message => @attr, :format => :json

      assert_response 422
    end
  end
end