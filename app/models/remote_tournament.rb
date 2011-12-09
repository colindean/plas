=begin
  
This class exists primarily to act as a bridge between a tournament and its
remote API interface, if one exists.
  
=end
class RemoteTournament < ActiveRecord::Base
  belongs_to :tournament_bracket, :polymorphic => true
  
  
  def tournament_bracket_type_type=(sType)
     super(sType.to_s.classify.constantize.base_class.to_s)
  end
  
end
