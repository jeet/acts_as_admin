require 'administrator'
require 'acts_as_admin'


ActiveRecord::Base.send :include, Acts::Admin

if defined?(ActionController) and defined?(ActionController::Base)
  true
end
