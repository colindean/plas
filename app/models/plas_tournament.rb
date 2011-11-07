class PlasTournament < ActiveRecord::Base
  belongs_to :winner
  belongs_to :creator
  has_and_belongs_to_many :participants, :class_name => "User"
  validates :name, :presence => true, :uniqueness => true, :length => {:minimum => 2 }
  validates :max_participants, :numericality => { :greater_than => 0 }

  # name:string winner:references creator:references max_participants:integer
  # description:text

  def full?
    remaining == 0
  end

  def remaining
    max_participants - participants.size
  end


end
