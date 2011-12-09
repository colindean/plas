class Tournament < ActiveRecord::Base
  belongs_to :event 
  validates :event, :presence => true
  has_one :remote, :as => :tournament_bracket, :dependent => :destroy

  #remote, event
  #the remote actually has all the logic

  def after_initialize
    challonge_init if challonge? and challonge_initialized?
  end

  alias :r :remote

  def internal?
    remote_tournament_type == "PLASTournament"
  end

  def challonge?
    remote_tournament_type == "Challonge::Tournament"
  end

  def challonge_initialized?
    Challonge::API.username.nil?
  end

  def challonge_init
    u = Pcfg.get('challonge.api.username')
    k = Pcfg.get('challonge.api.key')
    
    msg = _("The Challonge API credentials are not set.")
    raise PLAS::Exceptions::RemoteTournamentError,  msg if !(u and k)
    
    Challonge::API.username = u
    Challonge::API.key = k  
  end
  
    

end
