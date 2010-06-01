class BaseController < ApplicationController
  layout "admin_layout"
       unloadable
  before_filter :admin_required  ,:set_page
  
  
  protected
  def set_page
    @per_page = params[:per_page]  || 10

  end
  
end