class PasswordResetsController < ApplicationController
  
  before_filter :require_no_user 
  
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  
  def new
    render
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user and @user.deliver_password_reset_instructions!
      flash[:success] = "Instructions to reset your password have been sent to #{@user.email}. Please check your email."
      redirect_to root_url
    else  
      flash[:error] = "No user was found with that email address"
      render :action => :new  
    end
  end

  def edit  
    render
  end  
    
  def update  
    @user.passwords_required = true
    
    @user.password = params[:user][:password]  
    @user.password_confirmation = params[:user][:password_confirmation]
    
    if @user.save  
      flash[:success] = "Your password has been changed"
      redirect_to account_url
    else  
      render :action => :edit
    end  
  end  

end
