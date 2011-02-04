class UserGroupsController < ApplicationController

=begin
######
these methods deal with adding users to a group
####
=end

  def list_candidates
    @user_group = UserGroup.find(params[:user_group_id])
    @users = User.all
    #get the list of users NOT in the group already
    @user_list = @users - @user_group.users

    respond_to do |format|
      format.html
      format.xml { render :xml => @user_list }
      format.json { render :json => @user_list }
    end
  end

  def add_permission
    @user_group = UserGroup.find(params[:user_group_id])
    @permission = Permission.find(params[:permission_to_user_groups][:permission_id])

    @user_group.permissions << @permission

    respond_to do |format|
      if @user_group.save
        format.html { redirect_to(request.referrer, :notice => _("%s added to %s") % [@permission.name, @user_group.name]) }
        format.json { render :json => true }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def remove_permission
    @user_group = UserGroup.find(params[:user_group_id])
    @permission = Permission.find(params[:permission_id])

    @user_group.permissions.delete @permission
  
    respond_to do |format|
      if @user_group.save
        format.html { redirect_to(request.referrer, :notice => _("%s removed from %s.") % [@permission.name, @user_group.name]) }
        format.json { render :json => true }
        format.xml  { head :ok }
      else
        format.html { render :action => "show", :notice => _("Unable to remove permission %s from group %s") % [@permission.name, @user_group.name] }
        format.json { render :json => @user_group.errors, :status => :failure }
        format.xml  { render :xml => @user_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def add_user
    @user_group = UserGroup.find(params[:user_group_id])
    @user = User.find(params[:user_to_user_groups][:user_id])

    @user_group.users << @user

    respond_to do |format|
      if @user_group.save
        format.html { redirect_to(request.referrer, :notice => _("%s added to %s") % [@user.display_name, @user_group.name]) }
        format.json { render :json => true }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def remove_user
    @user_group = UserGroup.find(params[:user_group_id])
    @user = User.find(params[:user_id])

    @user_group.users.delete @user
  
    respond_to do |format|
      if @user_group.save
        format.html { redirect_to(request.referrer, :notice => _("%s removed from %s.") % [@user.display_name, @user_group.name]) }
        format.json { render :json => true }
        format.xml  { head :ok }
      else
        format.html { render :action => "show", :notice => _("Unable to remove user %s from group %s") % [@user.display_name,@user_group.name] }
        format.json { render :json => @user_group.errors, :status => :failure }
        format.xml  { render :xml => @user_group.errors, :status => :unprocessable_entity }
      end
    end
  end

=begin
######
#This method makes someone god if there are no admins
######
=end

  def godmode
    paa = Permission.find_by_code('app.administrate')
    if paa.users.count == 0
      g = paa.user_groups[0] #get the first group which has admin
                             #permissions, usually Applications Admins
      
      g.users << current_user
      if g.save
        respond_to do |format|
          format.html { 
            redirect_to(root_path, 
                        :notice => _("You, %s, are now a part of %s, which has administrator permissions.") % [current_user.display_name, g.name]
                       ) 
          }
          format.xml { head :ok }
        end
      end
    else
      respond_to do |format|
        format.html {
          redirect_to(root_path,
                      :notice => _("You cannot play god!")
                     )
        }
        format.xml { head :error }
      end
    end
  end

=begin
######
method below here deal with the CRUD of the UserGroup itself
####
=end
  
  # GET /user_groups
  # GET /user_groups.xml
  def index
    @user_groups = UserGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_groups }
    end
  end

  # GET /user_groups/1
  # GET /user_groups/1.xml
  def show
    @user_group = UserGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_group }
    end
  end

  # GET /user_groups/new
  # GET /user_groups/new.xml
  def new
    @user_group = UserGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_group }
    end
  end

  # GET /user_groups/1/edit
  def edit
    @user_group = UserGroup.find(params[:id])
  end

  # POST /user_groups
  # POST /user_groups.xml
  def create
    @user_group = UserGroup.new(params[:user_group])

    respond_to do |format|
      if @user_group.save
        format.html { redirect_to(@user_group, :notice => 'User group was successfully created.') }
        format.xml  { render :xml => @user_group, :status => :created, :location => @user_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_groups/1
  # PUT /user_groups/1.xml
  def update
    @user_group = UserGroup.find(params[:id])

    respond_to do |format|
      if @user_group.update_attributes(params[:user_group])
        format.html { redirect_to(@user_group, :notice => 'User group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_groups/1
  # DELETE /user_groups/1.xml
  def destroy
    @user_group = UserGroup.find(params[:id])
    @user_group.destroy

    respond_to do |format|
      format.html { redirect_to(user_groups_url) }
      format.xml  { head :ok }
    end
  end
end
