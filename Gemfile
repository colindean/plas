source 'http://rubygems.org'
gem 'rails', '3.0.5'

#these next few lines address problems building on ubuntu natty
gem 'bzip2-ruby' #, :git =>'git://github.com/colindean/bzip2-ruby'
gem 'nokogiri', '~>1.5.0.beta.3'
gem 'ffi', '~>1.0.0'
gem 'gherkin' #, :git => 'git://github.com/colindean/gherkin'
#end

gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'

#i18n stuff
gem "fast_gettext", :git => 'git://github.com/grosser/fast_gettext.git'
#gem '>=1.9.3', "gettext", :require => false
#gem "gettext",">=1.9.3", :require => false
gem 'gettext', :git => 'git://github.com/colindean/gettext.git' #fixes Config deprecation warnings
gem 'gettext_i18n_rails', :git => 'git://github.com/grosser/gettext_i18n_rails.git'

#payment stuff
gem 'activemerchant'
gem 'money'

#for permissions
gem 'acts_as_tree', :git => "git://github.com/parasew/acts_as_tree.git"

#jquery uber alles
gem 'jquery-rails'

#for tournament brackets...
#gem 'challonge-api' #https://bitbucket.org/corneldm/challonge-api/wiki/Home

group :development,:test do
  gem 'factory_girl_rails'
  gem 'watchr'
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  #gem 'cucumber' # , :git => 'git://github.com/colindean/cucumber.git' #fixes Config deprecation warnings
  #gem 'rspec' #, '~>2.0.0.beta.20'
  #gem 'rspec-rails' #, '~>2.0.0.beta.20'
  #gem 'cucumber-rails'
  gem 'spork'
  gem 'rcov'

end

#app-specific stuff
gem 'steam-condenser' #http://koraktor.github.com/steam-condenser
