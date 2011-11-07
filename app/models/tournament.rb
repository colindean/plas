class Tournament < ActiveRecord::Base
  belongs_to :event
  has_one :remote_tournament, :dependent => :destroy
  
  validates :event, :presence => true
  validates :remote_tournament, :presence => true

  #remote_tournament, event

  #this class really just just an interface to an interface.
  #TODO: merge RemoteTournament and this

  def internal?
    remote.class.to_s == "PlasTournament"
  end
  
  def remote
    @remote ||= remote_tournament.get
  end
    

end
