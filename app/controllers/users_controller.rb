class UsersController < ApplicationController
  skip_before_filter :require_logged_in

  def new
  end
  def create
    @user = User.new(params[:user])    
    if @user.save
      flash[:notice] = "Created user [#{@user}] succesfully."      
      session[:user_id] = @user.id   
      redirect_to root_path
    else
      render :new
    end
    
  end
end
