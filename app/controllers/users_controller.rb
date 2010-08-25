class UsersController < ApplicationController
	before_filter :require_no_user, :only => [:new, :create]
	before_filter :require_user, :only => [:edit, :update, :show]

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
		#begin
    @user = User.find_by_id(params[:id])
		#rescue
		#@user = User.find_one_by_handle(params[:handle])
		#end

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
    @u = User.find(params[:id])
		if @u == @current_user
			@user = @current_user
		else
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
					redirect_to(account_url, :notice => _('Your account  was successfully created.')) 
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
		if @u == @current_user
			@user = @current_user
		else
			redirect_to(account_url, :notice => _("You cannot update someone who isn't you!"))
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
    @u = User.find(params[:id])
		if @u == @current_user
			@user = @current_user
		else
			redirect_to(account_url, :notice => _("You cannot destroy someone who isn't you!"))
		end

    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
