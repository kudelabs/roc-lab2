class RepliesController < ApplicationController

  def create
    msg = Message.find(params[:message_id])
    reply = msg.replies.build(params[:reply])
    reply.user = current_user
    reply.save    
    redirect_to msg
  end

end
