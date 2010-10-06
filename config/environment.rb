# Load the rails application
require File.expand_path('../application', __FILE__)

#these may be unnecessarily require'd here
require 'activemerchant'
require 'money'

# Initialize the rails application
Plas::Application.initialize!
