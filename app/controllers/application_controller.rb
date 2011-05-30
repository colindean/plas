class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
	before_filter :set_gettext_locale
#	filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  helper_method :current_event
  helper_method :firebug
  
  use Rack::FirebugLogger if Rails.env == "development"

  private
    def firebug(message,type = :debug)
      request.env['firebug.logs'] ||= []
      request.env['firebug.logs'] << [type.to_sym, message.to_s]
    end
  
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

    #makes for shorter before_filter methods
    def user_can(permission, fail_notice)
			unless current_user and current_user.can(permission)
				store_location
				flash[:notice] = fail_notice
				redirect_to request.referrer
				return false
			end
			return true
    end

		#TODO: refactor these into their own file, as there's likely to be a lot of them
		def require_permission_users_administrate
		  user_can 'users.administrate', _("You must be an event administrator to access this page.")
    end
		
		def require_permission_events_administrate
      user_can 'events.administrate', _("You must be an event administrator to access this page.")
		end

		def require_permission_app_administrate
			user_can 'app.administrate', _("You must be an app administrator to access this page.")
    end

    def current_event
      return @current_event if defined?(@current_event)
      @current_event = nil
      eid = Pcfg.get('event.current')
      if eid
        @current_event = Event.find(eid)
      end
    end

end
