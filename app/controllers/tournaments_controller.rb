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

