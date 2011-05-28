class Permission < ActiveRecord::Base
  #include Comparable
  acts_as_tree :order => :code
  
  has_many :permission_to_user_group
  has_many :user_groups, :through => :permission_to_user_group
  #TODO: make this work, delete #build_users and #users
  #has_many :users, :source => :user_groups
#  belongs_to :parent, :class_name => "Permission"

  
  #TODO: validations
  def build_users
    #ideally, this would be handled by the has_many :permissions, but that
    #doesn't work no matter what I try
    groups = self.user_groups
    users = groups.collect do |g|
      g.users.collect do |p|
        p
      end
    end
    users.flatten
  end
  private :build_users

  def users
    #we only should calculate this once, because it's expensive
    @users ||= build_users
  end

  def sort_text(other)
    return code <=> other.code if category == other.category
    category <=> other.category
  end

end
