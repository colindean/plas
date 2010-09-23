class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
	before_filter :set_gettext_locale
#	filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

	private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:notice] = _("You must be logged in to access this page")
        redirect_to login_url
        return false
      end
			return true
    end		

    def require_no_user
      if current_user
        store_location
        flash[:notice] = _("You must be logged out to access this page")
        redirect_to account_url
        return false
      end
			return true
    end

    
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

		#TODO: refactor these into their own file, as there's likely to be a lot of them
		def require_user_useradmin
			unless current_user and current_user.can('users.administrate')
				store_location
				flash[:notice] = _("You must be a user administrator to access this page.")
				redirect_to request.referrer
				return false
			end
			return true
		end
		
		def require_user_eventadmin
			unless current_user and current_user.can('events.administrate')
				store_location
				flash[:notice] = _("You must be an event administrator to access this page.")
				redirect_to request.referrer
				return false
			end
			return true
		end
end
