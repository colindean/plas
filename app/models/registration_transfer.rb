class RegistrationTransfer < ActiveRecord::Base
  belongs_to :registration, :class_name => "Registration"
  belongs_to :to_user, :class_name => "User"
  belongs_to :from_user, :class_name => "User"
  belongs_to :by_user, :class_name => "User"

  validates_presence_of :to_user
  validates_presence_of :from_user
  validates_presence_of :by_user
  validates_presence_of :registration

  validate :validate_to_from_shall_not_be_same
  validate :validate_reg_is_givable

  def validate_to_from_shall_not_be_same
    errors.add(:to_user, "and from_user cannot be the same!") if to_user == from_user
  end

  def validate_reg_is_givable
    errors.add(:registration, "is not givable") if registration and !registration.givable?
  end 
end
