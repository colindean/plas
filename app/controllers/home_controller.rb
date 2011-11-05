class HomeController < ApplicationController

  has_widgets do |root|
    @cu = current_user
    root << widget(:shoutbox, :current_user => current_user)
    puts current_user
  end

  def index
    firebug "Initializing FirebugLogger..."	
  end

end
