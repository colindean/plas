class Transaction < ActiveRecord::Base
=begin
Some explanation is in order.

Put address things in an instance of Address and then set Transaction.address with it.

amount, email, payer_name, payer_country are pretty self-explanatory

processor_userid = Paypal's payer_id
payment_id = PayPal's token, check number, or walk-in id, etc.

payment_media = paypal | check | walkin

comments = Paypal's comments

recorded_by is the current_user for check/walkin, or leave nil for automatic

registration links to the generated registration

=end
  belongs_to :address #, :dependent => :destroy

  belongs_to :recorded_by, :class_name => "User"
  has_many :registrations
  accepts_nested_attributes_for :address, :allow_destroy => true

  #TODO: validations
  
  def self.new_from_paypal_details(details)
    #note that this is not saved on creation!
    t = self.new
    t.address = Address.new_from_paypal_address(details.address)
    t.email = details.email
    t.payer_name = details.name
    t.payer_country = details.payer_country
    t.processor_userid = details.payer_id
    t.payment_id = details.token
    t.payment_media = 'paypal'
    t.comments = nil
    t.recorded_by = nil
    t
  end

  def self.create_from_offline_payment(params)
    t = self.create(params)
    t.registrations << Registration.find(params["registration_id"])
    t.payment_media = 'offline'
    t
  end


end
