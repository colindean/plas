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

desc "Create .mo files for gettext i18n/l10n"
task :makemo do
	GetText.create_mofiles
end
desc "Update pot/po files to match new version."
take :updatepo do
	PLAS_TEXT_DOMAIN = "plas"
	PLAS_VERSION = "plas 2010"
	GetText.update_pofiles(PLAS_TEXT_DOMAIN, 
												 Dir.glob("{app,lib}/**/*.{rb,rhtml}"),
												 PLAS_VERSION)
end

Rails::Application.load_tasks
