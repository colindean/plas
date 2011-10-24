class TournamentsController < ApplicationController

  before_filter :challonge_init
  
  def index
    begin
      @tournaments = Challonge::Tournament.find(:all)
    rescue ActiveResource::UnauthorizedAccess
      @tournaments = []
      flash[:alert] = _("The Challonge API access was denied because this application was unauthorized to access it. Tell the administrators to check the API access credentials.")
    rescue ActiveResource::ClientError => err
      @tournaments = []
      flash[:alert] = _("Unable to retrieve tournaments from the Challonge server: " + err.message)
    end
  end

  def challonge_init
    u = Pcfg.get('challonge.api.username')
    k = Pcfg.get('challonge.api.key')
    if !(u and k)
      redirect_to root_url, :notice => _("Tell the administrators that the Challonge API information is not set.")
      return
    end
    
    Challonge::API.username = u
    Challonge::API.key = k
    firebug("Accessing Challonge as #{u}")
    
  end

end

