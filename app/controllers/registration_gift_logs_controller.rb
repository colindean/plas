class RegistrationGiftLogsController < ApplicationController

  before_filter :require_permission_registrationgiftlogs_view, :only => [:index, :show]
  
  def require_permission_registrationgiftlogs_view
    #TODO: make this a real, new permission
    user_can('app.administrate', _("You cannot view registration gift logs."))
  end

  # GET /registration_gift_logs
  # GET /registration_gift_logs.xml
  def index
    @registration_gift_logs = RegistrationGiftLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registration_gift_logs }
    end
  end

  # GET /registration_gift_logs/1
  # GET /registration_gift_logs/1.xml
  def show
    @registration_gift_log = RegistrationGiftLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration_gift_log }
    end
  end

  # GET /registration_gift_logs/new
  # GET /registration_gift_logs/new.xml
  def new
    @rgl = RegistrationGiftLog.new
    @rgl.registration = Registration.find_by_id(params["registration"])
    @rgl.by_user = current_user
    @rgl.from_user = @rgl.registration.givable_by

    #TODO: this could be more efficient
    @to_user_list = User.all.select{|u| u != @rgl.from_user}.collect{|u| [u.display_name, u.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rgl }
    end
  end

  # GET /registration_gift_logs/1/edit
  #def edit
  #  @registration_gift_log = RegistrationGiftLog.find(params[:id])
  #end

  # POST /registration_gift_logs
  # POST /registration_gift_logs.xml
  def create
    @rgl = RegistrationGiftLog.new()
    @rgl.registration = Registration.find_by_id(params[:registration_gift_log][:registration])
    @rgl.by_user = current_user
    @rgl.from_user = @rgl.registration.givable_by

    @rgl.to_user = User.find(params[:registration_gift_log][:to_user])

    r = @rgl.registration
    #all this business logic just for this stupid line
    r.user = @rgl.to_user
    r.date_given = Time.now


    respond_to do |format|
      if r.save and @rgl.save
        format.html { redirect_to(account_url, :notice => 'Registration gift log was successfully created.') }
        format.xml  { render :xml => @rgl, :status => :created, :location => @rgl}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rgl.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registration_gift_logs/1
  # PUT /registration_gift_logs/1.xml
  #def update
  #  @registration_gift_log = RegistrationGiftLog.find(params[:id])
  #
  #  respond_to do |format|
  #    if @registration_gift_log.update_attributes(params[:registration_gift_log])
  #      format.html { redirect_to(@registration_gift_log, :notice => 'Registration gift log was successfully updated.') }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @registration_gift_log.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /registration_gift_logs/1
  # DELETE /registration_gift_logs/1.xml
  #  def destroy
  #    @registration_gift_log = RegistrationGiftLog.find(params[:id])
  #    @registration_gift_log.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to(registration_gift_logs_url) }
  #    format.xml  { head :ok }
  #  end
  #end
end
