class TransactionsController < ApplicationController
  before_filter :require_permission_transactions_view, :only => ['index','show']
  before_filter :require_permission_payments_accept, :only => ['new', 'create']

  # GET /transactions
  # GET /transactions.xml
  def index
    @transactions = Transaction.find(:all, :order => 'created_at DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.xml
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  def new
    @transaction = Transaction.new
    @transaction.address = Address.new if @transaction.address == nil
    begin
      @registration = Registration.find(params[:registration])
      @transaction.registrations << (@registration.package_parent ? @registration_package_parent : @registration)
    rescue ActiveRecord::RecordNotFound => e
      redirect_to request.referrer, :notice => "You cannot record a transaction when you don't know which registration for which you are recording it!"
      return
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => {:transaction => @transaction, :registration => @registration } }
    end
  end

  def create
    @transaction = Transaction.create_from_offline_payment(params["transaction"])
    @transaction.recorded_by = current_user
    
    firebug params["transaction"].to_json

    respond_to do |format|
      if @transaction.save
        format.html { 
          redirect_to(@transaction.registrations.first.purchaser, :notice => _('Payment recorded.')) 
        }
        format.xml  { render :xml => @transaction, :status => :created, :location => @transaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  def require_permission_payments_accept
    user_can('payments.accept', _("You are not permitted to record transactions."))
  end
  def require_permission_transactions_view
    user_can('transactions.view', _("You are not permitted to view transactions."))
	end
end
