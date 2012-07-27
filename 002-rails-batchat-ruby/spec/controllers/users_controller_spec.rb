require 'spec_helper'

describe UsersController do
  before do (:each)
    @user = FactoryGirl.build(:user)
  end

  describe "GET #index" do
    it "should retrieve all of the logged in users" do
      User.stub!(:check_expiry) { true }
      User.stub!(:where) { @user }

      get :index, :format => :json

      response.should be_success
      ActiveSupport::JSON.decode(response.body).should == @user.as_json({:root => true, :only => [ :id, :name, :logged_in ]})
    end
  end

  describe "PUT #update" do
    it "should keep user from expiring" do
      user_date = DateTime.now
      DateTime.stub!(:now) { user_date }
      User.stub!(:find) { @user }
      @user.stub!(:save!) { true }

      put :update, :id => 88, :format => :json

      @user.updated_at.should == user_date
      response.should be_success
    end
  end

  describe "POST #create" do
    it "should create a new record" do
      @attr = FactoryGirl.attributes_for(:user)
      User.stub!(:save) { true }
      User.stub!(:new) { @user }
      @user.stub!(:save) { true }

      post :create, :user => @attr, :format => :json

      assert_response :success
    end

    it "should not create a new record" do
      @attr = FactoryGirl.attributes_for(:invalid_user)
      User.stub!(:save) { false }

      post :create, :user => @attr, :format => :json

      assert_response 422 # invalid entity
    end
  end

  describe "GET #show" do
    it "should return a user" do
      User.stub!(:find) { @user }

      get :show, :id => 88, :format => :json

      ActiveSupport::JSON.decode(response.body).should == @user.as_json({:root => true, :only => [ :id, :name, :logged_in ]})
      response.should be_success
    end
  end
end