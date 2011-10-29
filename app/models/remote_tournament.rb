class RemoteTournament < ActiveRecord::Base
  belongs_to :tournament
  
  #tournament, #remote_type, #remote_id
  
  def resolve_class
    remote_type.camelize.constantize
  end
  
  def get
      resolve_class.find(remote_id)  
  end
  
end
