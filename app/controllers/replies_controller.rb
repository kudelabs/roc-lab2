class RepliesController < ApplicationController


  def create
    msg = Message.find(params[:message_id])
    msg.replies.create(params[:reply])
    redirect_to msg
  end

end
