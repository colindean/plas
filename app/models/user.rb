class User < ActiveRecord::Base
	validates :given_name, :presence => true, :length => { :minimum => 1 }
	validates :family_name, :presence => true, :length => { :minimum => 1 }
	validates :handle, :presence => true
	validates :email, :presence => true

	validates_format_of :email, 
			:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_inclusion_of :gender, :in => %w{ m f male female guy girl dude dudette transsexual t hermaphrodite h }
	
	def self.find_by_handle(handle)
		find(:all, :conditions => ["LOWER(handle) = ?", handle.downcase])
	end
	
end
