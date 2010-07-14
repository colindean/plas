class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
	before_filter :set_gettext_locale
end
