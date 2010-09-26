class TicketsController < ApplicationController
  before_filter :get_event

  def get_event
    @event = Event.find(params[:event_id])
  end

  # GET /tickets
  # GET /tickets.xml
  def index
    @tickets = @event.tickets

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = @event.tickets.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @ticket = @event.tickets.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = @event.tickets.find_by_id(params[:id])
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    @event = Event.find(params[:event_id])
    #@ticket = Ticket.new(params[:ticket])
    @event.tickets.build(params[:ticket])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Ticket was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = @event.tickets.find_by_id(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to(@ticket, :notice => 'Ticket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @event.tickets.find_by_id(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to(tickets_url) }
      format.xml  { head :ok }
    end
  end
end
