ActionController::Routing::Routes.draw do |map|
  map.resources :administrators,  :controller  => "administrator"
  map.administrator_index "/administrator/index/:mod", :controller => "administrator", :action => "show_index", :mod => :mod

end