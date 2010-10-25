class User < ActiveRecord::Base

	validates :given_name, :presence => true, :length => { :minimum => 1 }
	validates :family_name, :presence => true, :length => { :minimum => 1 }
	validates :email, :presence => true

	validates_format_of :email, 
			:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	has_many :addresses, :dependent => :destroy
  belongs_to :usergroups

	acts_as_authentic do |c|
		c.require_password_confirmation = false
	end

	def self.find_one_by_handle(handle)
		@l = find(:all, :conditions => ["LOWER(handle) = ?", handle.downcase])
		if @l.length > 1
			@l
		else
			@l[0]
		end
	end
	def self.find_by_handle(handle)
		find(:all, :conditions => ["LOWER(handle) = ?", handle.downcase])
	end

	def can(permission)
		#TODO: Make permission stuff resolve
		true
	end

	def has_handle
		return (handle and not handle.empty?)
	end

	def display_name
		return handle if has_handle
		return "%s %s" % [given_name, family_name]	
	end

	def full_name
		return '%s "%s" %s' % [given_name, handle, family_name] if has_handle
		return display_name
	end

end
