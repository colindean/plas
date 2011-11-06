class TournamentsController < ApplicationController
  
  def index
    begin
      @tournaments = Tournament.all
      
    rescue ActiveResource::UnauthorizedAccess
      @tournaments = []
      flash[:alert] = _("The remote tournament access was denied because this application was unauthorized to access it. Tell the administrators to check the API access credentials.")
    rescue ActiveResource::ClientError => err
      @tournaments = []
      flash[:alert] = _("Unable to retrieve tournaments from the Challonge server: " + err.message)
    end
  end

  def show
    begin
      @tournament = Tournament.find params[:id]
    rescue ActiveResource::UnauthorizedAccess
      @tournaments = nil
      flash[:alert] = _("The Challonge API access was denied because this application was unauthorized to access it. Tell the administrators to check the API access credentials.")
    rescue ActiveResource::ClientError => err
      @tournaments = nil
      flash[:alert] = _("Unable to retrieve tournaments from the Challonge server: " + err.message)
    end
  end

  #GET /event/:id/tournament/new
  #GET /event/:id/tournament/new.xml
  def new
    @tournament = Tournament.new
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @tournament }
    end
  end

  #GET /event/1/tournament/1/edit
  def edit
    @tournament = Tournament.find params[:id]
  end

  #POST /event/1/tournament
  #POST /event/1/tournament.xml
  def create
    @tournament = Tournament.new params[:tournament]

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to(@tournament, :notice => _("Tournament was successfully created.")) }
        format.xml { render :xml => @tournament, :status => :created, :location => @tournament }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @tournamet.errors, :status => :unprocessable_entity  }
      end
    end
  end

  def update
    @tournament = Tournament.find params[:id]

    respond_to do |format|
      if @tournament.update_attributes params[:tournament]
        format.html { redirect_to(@tournament, :notice => _("Tournament was successfully updated.")) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @tournament.errors, :status => :unprocessable_entity  }
      end
    end
  end

  def destroy
    @tournament = Tournament.find params[:id]
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to(tournaments_url) }
      format.html { head :ok }
    end
  end



  
  private
  
  #this operation might be better performed in the Tournament model
  def resolve(object)
    if object.respond_to? :collect # if it's an array
      return object.collect do |t| 
        resolve_one t
      end
    else
      #otherwise it's a standalone
      resolve_one t
    end
  end
  
  def resolve_one(t)
    if t.remote?
      t.remote
    else
      t
    end    
  end

end

