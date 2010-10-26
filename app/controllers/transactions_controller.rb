class TransactionsController < ApplicationController
  before_filter :require_permission_transactions_view

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

  def require_permission_transactions_view
    user_can('transactions.view', _("You are not permitted to view transactions."))
	end
end
