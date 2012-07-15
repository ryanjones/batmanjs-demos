class MessagesController < ApplicationController
  respond_to :json

  def index
    respond_with Message.all
  end

  def create
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.save
        format.json { render :json => @message }
      else
        format.json { render :json => @message.errors, :status => :unprocessable_entity}
      end
    end
  end

end
