class UserSession < Authlogic::Session::Base
  def self.humanize_class_name
    "UserSession"
  end
end
