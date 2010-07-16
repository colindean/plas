# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
	require "gettext_i18n_rails/tasks"
rescue LoadError
	puts "gettext_i18n_rails is not installed, you should probably run 'bundle install'"
end

Rails::Application.load_tasks
