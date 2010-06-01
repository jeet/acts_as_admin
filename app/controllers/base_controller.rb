class BaseController < ApplicationController
  layout "admin_layout"
       unloadable
  before_filter :admin_required
  
end