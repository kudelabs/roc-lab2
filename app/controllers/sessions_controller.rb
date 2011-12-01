class SessionsController < ApplicationController
  skip_before_filter :require_logged_in
  def new
  end
  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
  def create
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Wrong user or password."
      render :new
    end
  end

end
