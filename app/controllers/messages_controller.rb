class MessagesController < ApplicationController
  def create
  	@message = Message.create!(params[:message])
  	PrivatePub.publish_to('chat', message: @message)
  end

  def new
  	
  end

  def index
  	@messages = Message.all
  end
end
