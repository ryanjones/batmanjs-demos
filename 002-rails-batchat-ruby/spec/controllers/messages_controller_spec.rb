require 'spec_helper'

describe MessagesController do
  before do (:each)
    @message = FactoryGirl.build(:message)
  end

  describe "GET #index" do
    it "should retrieve all of the messages" do
      Message.stub!(:last) { @message }

      get :index, :format => :json

      response.should be_success
      ActiveSupport::JSON.decode(response.body).should == @message.as_json({:root => true, :only => [ :id, :content, :user_id ]})
    end
  end

  describe "POST #create" do
    it "should create a message" do
      Message.stub!(:new) { @message }
      @message.stub!(:save) { true }

      post :create, :message => Factory.attributes_for(:message), :format => :json

      response.should be_success
    end

    it "should not create a message" do
      @attr = FactoryGirl.attributes_for(:invalid_message)
      @invalid_message = FactoryGirl.build(:invalid_message)

      Message.stub!(:new) { @invalid_message }
      @message.stub!(:save) { false }

      post :create, :message => @attr, :format => :json

      assert_response 422
    end
  end

end