class Pcfg < ActiveRecord::Base
  attr_accessible :key, :value
  #TODO: validations
  belongs_to :last_modified_by, :class_name => "User"

  #validates_presence_of :last_modified_by
  validates_presence_of :key
  validates_uniqueness_of :key

  def self.get(key)
    begin
      self.find_by_key(key).value
    rescue ActiveRecord::RecordNotFound
      nil
    rescue NoMethodError
      nil
    end
  end

  def self.set(key, value, user=nil)
      pcfg = self.find_by_key(key) || Pcfg.create(:key => key)
      pcfg.value = value
      pcfg.last_modified_by = user
      if not pcfg.save
        raise "Pcfg could not be saved: #{pcfg.errors}"
        return false
      end
      pcfg
  end

  def self.unset(key)
    begin
      self.find_by_key(key).destroy
      true
    rescue ActiveRecord::RecordNotFound
      false
    end
  end

  def to_s
    key + " => '" + value + "'"
  end
  def to_str
    value
  end
end
