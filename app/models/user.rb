class User < ActiveRecord::Base
  #things we'll access regularly
  attr_accessible :name, :pronunciation, :handle, :email, :birthdate, :gender,
                  :disabled, :password
  #mostly internal things that are OK to access for admins only
  attr_accessible :created_at, :updated_at, :login_count, :failed_login_count, 
                  :last_request_at, :current_login_at, :last_login_at, 
                  :current_login_ip, :last_login_ip

  validates :name, :presence => true, 
                   :length => { :minimum => 1 }

  validates :pronunciation, :presence => true, 
                            :length => { :minimum => 1 }

	validates :email, :presence => true,  
			              :format => { 
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i 
                     }

	has_many :addresses, :dependent => :destroy

  has_many :user_to_user_group
  has_many :user_groups, :through => :user_to_user_group
  has_many :registrations
  
  has_and_belongs_to_many :tournaments
  
  #TODO: make this work and get rid of #permissions and #build_permissions
  #has_many :permissions, :through => :user_groups, :source => :user_groups

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

  def build_permissions
    #ideally, this would be handled by the has_many :permissions, but that
    #doesn't work no matter what I try
    #
    #TODO: improve efficiency of this giant thing
    groups = self.user_groups
    perms = groups.collect do |g|
      g.permissions.collect do |p|
        [p, p.descendants]
      end
    end
    perms.flatten.uniq
  end
  private :build_permissions

  def permissions
    #we only should calculate this once, because it's expensive
    @permissions ||= build_permissions
  end

	def can(permission_code)
		#TODO: Implement some kind of cache, as it's likely that the same
    #permission will hit more than once is a page load, no sense in going
    #through all of the permissions again every time.
    if permissions.select {|p| p.code == permission_code }.count != 0
      return true
    else
      if Rails.env.development? and not Permission.find_by_code(permission_code)
        raise _("Permission code %s does not exist") % permission_code
      end
    end
    false
	end

	def has_handle
		return (handle and not handle.empty?)
	end

	def display_name
		return handle if has_handle
    return name
	end
end
