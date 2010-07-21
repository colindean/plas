class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
	before_filter :set_gettext_locale
	filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

# TODO need to put stuff from http://github.com/binarylogic/authlogic_example/blob/5819a13477797d758cb6871f475ed1c54bf8a3a7/app/controllers/application_controller.rb in here


  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
end
