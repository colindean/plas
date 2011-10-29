class Tournament < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :participants, :class_name => "User"
  has_one :remote_tournament, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => true, :length => {:minimum => 2 }
  validates :max_participants, :numericality => { :greater_than => 0 }
  validates :event, :presence => true


  #name, description, max_participants, 
  #started_at, start_time, 
  #remote_tournament, event

  def remote?
    remote_tournament != nil
  end
  
  alias remote remote_tournament

  def started?
    started_at != nil
  end
  
  def full?
    participants.size < max_participants
  end
  
  def remaining
    max_participants - participants.size
  end

end
