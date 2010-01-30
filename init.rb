# if Rails.version < '3'
  config.gem 'rack-openid', :lib => 'rack/openid', :version => '>=0.2.1'
# end

config.middleware.use :OpenIdAuthentication
# require 'ruby-debug'; debugger
config.after_initialize do
  require 'rack/openid'
  OpenID::Util.logger = Rails.logger
  ActionController::Base.send :include, OpenIdAuthentication
end
