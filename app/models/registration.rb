class Registration < ActiveRecord::Base
  #TODO: validations
  belongs_to :ticket
  belongs_to :purchaser, :class_name => "User"
  belongs_to :user
  belongs_to :package_parent, :class_name => "Registration"
  belongs_to :transaction

#TODO: refactor to use Money instead of just having cents in price_paid
#  composed_of :price_paid,
#    :class_name => "Money",
#    :mapping => [%w(cents cents), %w(currency currency_as_string)],
#    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) }
  #
  composed_of :price_paid,
    :class_name => "Money",
    :mapping => [%w(paid_cents cents), %w(paid_currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

  def self.find_all_by_ticket_event(event)
    Registration.find_all_by_ticket_id(Ticket.find_all_by_event_id(event))
  end

  def self.all_unpaid
    Registration.where(:transaction_id => nil, 
                       :package_parent_id => nil)
  end

  def self.unpaid_for(user)
    Registration.where(:transaction_id => nil, 
                       :package_parent_id => nil,
                       :purchaser_id => user)
  end

  def givable_by
    user || purchaser
  end

  def givable?
    paid? and !checked_in?
  end

  def paid?
    transaction != nil
  end

  def gift?
    purchaser != user
  end

  def given?
    gift? and user != nil
  end

  def checked_in?
    checked_in
  end
end
