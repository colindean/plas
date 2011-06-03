class RegistrationTransfersController < ApplicationController

  before_filter :require_permission_registrationtransfers_view, :only => [:index]
  before_filter :can_user_see_transfer, :only => [:show]

  def require_permission_registrationtransfers_view
    user_can('app.administrate', _("You cannot view registration transfers."))
  end

  def can_user_see_transfer
    @registration_transfer = RegistrationTransfer.find(params[:id])
    return true if current_user == @registration_transfer.to_user or current_user == @registration_transfer.from_user or current_user == @registration_transfer.by_user or current_user.can('registrations.transfer')

    false
  end

  # GET /registration_transfers
  # GET /registration_transfers.xml
  def index
    @registration_transfers = RegistrationTransfer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registration_transfers }
    end
  end

  # GET /registration_transfers/1
  # GET /registration_transfers/1.xml
  def show
    @registration_transfer = RegistrationTransfer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration_transfer }
    end
  end

  # GET /registration_transfers/new
  # GET /registration_transfers/new.xml
  def new
    @registration_transfer = RegistrationTransfer.new
    @registration_transfer.registration = Registration.find_by_id(params["registration"])
    @registration_transfer.by_user = current_user
    @registration_transfer.from_user = @registration_transfer.registration.givable_by

    @to_user_list = User.all.select{|u| u != @registration_transfer.from_user}.collect{|u| [u.display_name, u.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration_transfer }
    end
  end

  # POST /registration_transfers
  # POST /registration_transfers.xml
  def create
    @registration_transfer = @rt = RegistrationTransfer.new
    
    @rt.registration = Registration.find_by_id(params[:registration_transfer][:registration])
    @rt.by_user = current_user
    @rt.from_user = @rt.registration.givable_by
    @rt.to_user = User.find(params[:registration_transfer][:to_user])

    @rt.registration.user = @rt.to_user
    @rt.registration.date_given = Time.now

    respond_to do |format|
      if @rt.registration.save and @registration_transfer.save
        format.html { redirect_to(@registration_transfer, :notice => _('Registration was successfully transferred. Please you may want to print this page for your records, or keep this URL, as proof of the transfer.')) }
        format.xml  { render :xml => @registration_transfer, :status => :created, :location => @registration_transfer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration_transfer.errors, :status => :unprocessable_entity }
      end
    end
  end

end
