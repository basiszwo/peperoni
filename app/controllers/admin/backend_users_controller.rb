class Admin::BackendUsersController < ApplicationController
  before_filter :require_admin_user
  
  def index
    @backend_users = BackendUser.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @backend_users }
    end
  end

  def new
    @backend_user = BackendUser.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @backend_user }
    end
  end

  def edit
    @backend_user = BackendUser.find(params[:id])
  end

  def create
    @backend_user = BackendUser.new(params[:backend_user])

    respond_to do |format|
      if @backend_user.save
        flash[:success] = 'BackendUser was successfully created.'
        format.html { redirect_to admin_backend_users_path }
        format.xml  { render :xml => @backend_user, :status => :created, :location => @backend_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @backend_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @backend_user = BackendUser.find(params[:id])
    
    respond_to do |format|
      if @backend_user.update_attributes(params[:backend_user])
        flash[:success] = 'BackendUser was successfully updated.'
        format.html { redirect_to admin_backend_users_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @backend_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @backend_user = BackendUser.find(params[:id])
    @backend_user.destroy

    respond_to do |format|
      format.html { redirect_to admin_backend_users_path }
      format.xml  { head :ok }
    end
  end
end
