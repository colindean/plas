class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
	init_gettext "plas"
end
