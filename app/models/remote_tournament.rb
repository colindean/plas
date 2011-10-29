=begin
  
This class exists primarily to act as a bridge between a tournament and its
remote API interface, if one exists.
  
=end
class RemoteTournament < ActiveRecord::Base
  belongs_to :tournament, :polymorphic => true
  
  validates :remote_type, :presence => :true
  validates :remote_id, :presence => :true
  
  #tournament, #remote_type, #remote_id 
  
  def type=(c)
    raise Error if c.class != Class
    remote_type = c.to_s
  end 
  
  def type
    resolve_class
  end
  
  def resolve_class
    remote_type.to_s.classify.constantize
  end
  
  def get
    resolve_class.find(remote_id)  
  end
  
  def set(remote_instance)
    self.type = remote_instance.class
    self.remote_id = remote_instance.id
    get
  end
end
