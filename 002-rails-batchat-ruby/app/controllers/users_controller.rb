class UsersController < ApplicationController
  respond_to :json

  def index
    User.check_expiry
    respond_with User.where(:logged_in => true)
  end

  def update
    @user = User.find(params[:id])
    @user.updated_at = DateTime.now
    @user.save!
    respond_with @user
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.json { render :json => @user }
      else
        format.json { render :json => @user.errors, :status => :unprocessable_entity}
      end
    end
  end

  def show
    respond_with User.find(params[:id])
  end

end
