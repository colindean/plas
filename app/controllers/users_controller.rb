class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :destroy ]
  
  def is_user_current_or_admin?(user) 
    user == current_user or current_user.can('users.administrate')   
  end
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    if params[:id]
      @user = User.find_by_id(params[:id])
    else
      @user = current_user
    end

    #there's gotta be a better way to do this in the view
    @is_user_current_or_admin = is_user_current_or_admin? @user

    @unpaid_registrations = Registration.unpaid_for(@user) if current_user.can('payments.accept')

    #this gets ones they bought, which isn't in @user.registrations
    @my_registrations = Registration.where( :purchaser_id => @user ).limit(10)

    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/1/edit
  def edit
    @u = params[:id] ? User.find(params[:id]) : current_user
    if is_user_current_or_admin?(@u)
      @user = current_user
    else
      flash[:notice] = _("You aren't permitted to change this user")
      render :action => :show
    end
  end
  
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html { 
          redirect_to(account_url, :notice => _('Your account was successfully created.')) 
        }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @u = User.find(params[:id])
    if is_user_current_or_admin? @u
      @user = current_user
    else
      redirect_to(account_url, :notice => _("You do not have permission to update %s") % @u.display_name)
      return
    end
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(account_url, :notice => _('Your account was successfully updated.')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    if is_user_current_or_admin? @user
      @user.destroy
    else
      redirect_to(account_url, :notice => _("You do not have permission to destroy %s") % @user.display_name)
      return
    end
    
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
