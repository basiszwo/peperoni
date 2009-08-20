class ActivationsController < ApplicationController
  before_filter :require_no_user
  
  def new
    render
  end
  
  def create
    @user = User.pending.find_by_email(params[:user][:email])
    if @user and @user.deliver_account_activation_instructions!
      flash[:success] = "A new activation email was sent to #{@user.email}. Please check your email."
      redirect_to login_path
    else  
      flash[:error] = "No pending user was found with that email address."
      render :action => :new  
    end
  end
  
  def edit
    # move users/activate here-in
  end
  
  def update
    
  end
  
end
