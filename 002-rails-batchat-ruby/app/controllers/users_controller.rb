class UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all
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

end
