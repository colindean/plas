class Registration < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :purchaser, :class_name => "User"
  belongs_to :user
  belongs_to :package_parent, :class_name => "Registration"

#TODO: refactor to use Money instead of just having cents in price_paid
#  composed_of :price_paid,
#    :class_name => "Money",
#    :mapping => [%w(cents cents), %w(currency currency_as_string)],
#    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) }

end
