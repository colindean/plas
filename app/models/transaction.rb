class Transaction < ActiveRecord::Base
=begin
Some explanation is in order.

Put address things in an instance of Address and then set Transaction.address with it.

amount, email, payer_name, payer_country are pretty self-explanatory

processor_userid = Paypal's payer_id
payment_id = PayPal's token, check number, or walk-in id, etc.

type = paypal | check | walkin

comments = Paypal's comments

recorded_by is the current_user for check/walkin, or leave nil for automatic

registration links to the generated registration

=end
  belongs_to :address, :dependent => :destroy
  belongs_to :recorded_by, :class_name => "User"
  belongs_to :registration

  #TODO: validations
end
