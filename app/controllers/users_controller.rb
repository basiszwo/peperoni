class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  before_filter :load_user_using_perishable_token, :only => [:activate]
  
  def new
    @user = FrontendUser.new
  end
  
  def create
    @user = FrontendUser.new(params[:user])
    if @user.save
      flash[:success] = "Instructions to activate your account have been sent to #{@user.email}. Please check your email!"
      redirect_to login_path
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:success] = "Account successfully updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def destroy
    @user = @current_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
    end
  end

  def activate
    if @user and @user.activate!
      UserSession.create(@user, true)
      
      flash[:success] = "Your account has been activated"
      redirect_to account_url
    else  
      flash[:error] = "Your activation link is invalid!"
      render :action => :new  
    end
  end
end
