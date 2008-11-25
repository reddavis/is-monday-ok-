# Go to http://wiki.merbivore.com/pages/init-rb
 
# Specify a specific version of a dependency
dependencies "merb-assets", "merb_helpers", "activesupport", "merb-mailer", "merb-exceptions"

use_orm :activerecord
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '0e81cc75acc2e36a8c4716afe6765b0d8416be23'  # required for cookie session store
  # c[:session_id_key] = '_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
  Merb::Plugins.config[:exceptions] = {
    :email_addresses => ['reddavis@gmail.com'],
    :app_name        => "Is Monday Ok?",
    :environments    => ['production'],
    :email_from      => "exceptions@ismondayok.com",
    :mailer_config => nil,
    :mailer_delivery_method => :sendmail
  }
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end
