require 'spec_helper'

describe UsersController do
  before do (:each)
    @user = FactoryGirl.build(:user)
  end

  describe "index" do
    it "should retrieve all of the logged in users" do
      User.stub!(:check_expiry) { true }
      User.stub!(:where) { @user }

      get :index, :format => :json

      response.should be_success
      ActiveSupport::JSON.decode(response.body).should == @user.as_json({:root => true, :only => [ :id, :name, :logged_in ]})
    end
  end

  describe "update" do
    it "should keep user from expiring" do
      user_date = DateTime.now
      DateTime.stub!(:now) { user_date }
      User.stub!(:find) { @user }
      User.stub!(:save) { true }

      put :update, :id => 88, :format => :json

      @user.updated_at.should == user_date
      response.should be_success
    end
  end

  describe "create" do
    before(:each) do
      @attr = FactoryGirl.attributes_for(:user)
    end

    it "passes" do
      User.stub!(:save) { true }

      post :create, :user => @attr, :format => :json

      assert_response :success
    end

    it "fails" do
      User.stub!(:save) { true }
      @attr.delete(:name)

      post :create, :user => @attr, :format => :json

      assert_response 422
    end
  end
end