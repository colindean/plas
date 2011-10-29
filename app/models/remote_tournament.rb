class RemoteTournament < ActiveRecord::Base
  belongs_to :tournament, :polymorphic => true
  
  #tournament, #remote_type, #remote_id
  
  def resolve_class
    remote_type.to_s.classify.constantize
  end
  
  def get
      resolve_class.find(remote_id)  
  end
  
end
