class Tournament < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :participants, :class_name => "User"
           
  has_one :remote_tournament

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

end
