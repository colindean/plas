source 'http://rubygems.org'
gem 'rails', '3.2.8'

#these next few lines address problems building on ubuntu natty
#gem 'bzip2-ruby' #, :git =>'git://github.com/colindean/bzip2-ruby'
#gem 'nokogiri', '~>1.5.0.beta.3'
#gem 'ffi', '~>1.0.0'
#gem 'gherkin' #, :git => 'git://github.com/colindean/gherkin'
#end

gem 'authlogic' #, :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'

#i18n stuff
gem "fast_gettext" #, :git => 'git://github.com/grosser/fast_gettext.git'
gem 'gettext' #, :git => 'git://github.com/colindean/gettext.git' #fixes Config deprecation warnings
gem 'gettext_i18n_rails' #, :git => 'git://github.com/grosser/gettext_i18n_rails.git'

#payment stuff
gem 'activemerchant'
gem 'money'

#for permissions
#required, this is the rails3 version of the gem (v 1.2.3 not 0.1.1 in
#rubygems)
gem 'acts_as_tree', :git => "git://github.com/parasew/acts_as_tree.git"

#jquery uber alles
gem 'jquery-rails'

#for tournament brackets...
gem 'challonge-api' #https://bitbucket.org/corneldm/challonge-api/wiki/Home

gem 'icalendar'

#for widgets, such as the shoutbox
gem 'apotomo' 

group :development,:test do
  gem 'factory_girl_rails'
  gem 'watchr'
  gem 'sqlite3'
  gem 'capybara' #, :git => 'git://github.com/jnicklas/capybara.git'
  #gem 'cucumber' # , :git => 'git://github.com/colindean/cucumber.git' #fixes Config deprecation warnings
  #gem 'rspec' #, '~>2.0.0.beta.20'
  #gem 'rspec-rails' #, '~>2.0.0.beta.20'
  #gem 'cucumber-rails'
  gem 'spork'
  gem 'simplecov'
end

group :test do
  #make test unit output more information, and colorize it
  gem 'turn'
end

#app-specific stuff
gem 'steam-condenser' #http://koraktor.github.com/steam-condenser

