class Event < ActiveRecord::Base
  #attr_accessible :address_attributes
  has_many :addresses, :dependent => :destroy
  has_many :tickets, :dependent => :destroy

  accepts_nested_attributes_for :addresses, :allow_destroy => true
  #TODO: validations

  def find_available_tickets
    tickets.select {|t| t.available?}
  end

  def seats_available
    num_seats_available = 0
    tickets.each do |t|
      num_seats_available = num_seats_available + t.available
    end
    num_seats_available
  end
  def seats_remaining
    num_seats_remaining = 0
    tickets.each do |t|
      num_seats_remaining = num_seats_remaining + t.remaining
    end
    num_seats_remaining
  end
  def calculate_num_seats
    tickets.each do |t|
      @num_seats_available = @num_seats_available + t.available
      @num_seats_remaining = @num_seats_remaning + t.remaining
    end
  end
end
