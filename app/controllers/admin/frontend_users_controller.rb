class Admin::FrontendUsersController < ApplicationController
  before_filter :require_admin_user
  
  def index
    @frontend_users = FrontendUser.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @frontend_users }
    end
  end

  def show
    @frontend_user = FrontendUser.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @frontend_user }
    end
  end

  def new
    @frontend_user = FrontendUser.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @frontend_user }
    end
  end

  def edit
    @frontend_user = FrontendUser.find(params[:id])
  end

  def create
    @frontend_user = FrontendUser.new(params[:frontend_user])

    respond_to do |format|
      if @frontend_user.save
        flash[:success] = 'FrontendUser was successfully created.'
        format.html { redirect_to admin_frontend_users_path }
        format.xml  { render :xml => @frontend_user, :status => :created, :location => @frontend_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @frontend_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @frontend_user = FrontendUser.find(params[:id])

    respond_to do |format|
      if @frontend_user.update_attributes(params[:frontend_user])
        flash[:success] = 'FrontendUser was successfully updated.'
        format.html { redirect_to admin_frontend_users_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @frontend_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @frontend_user = FrontendUser.find(params[:id])
    @frontend_user.destroy

    respond_to do |format|
      format.html { redirect_to admin_frontend_users_path }
      format.xml  { head :ok }
    end
  end
end
