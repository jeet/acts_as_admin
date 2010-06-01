ActionController::Routing::Routes.draw do |map|
  map.resources :administrators,  :controller  => "administrator"
  map.administrator_index "/administrator/index/:mod", :controller => "administrator", :action => "show_index", :mod => :mod
  map.new_record_admin "/administrator/:mod/new" ,:controller => "administrator",:action => :new , :mod => :mod
  map.create_record_admin "/administrator/:mod/create" ,:controller => "administrator",:action => :create , :mod => :mod
  map.edit_record_admin "/administrator/:mod/edit/:id" ,:controller => "administrator",:action => :edit , :mod => :mod,:id =>:id
  map.update_record_admin "/administrator/:mod/update/:id" ,:controller => "administrator",:action => :update , :mod => :mod ,:id =>:id
  map.destroy_record_admin "/administrator/:mod/destroy/:id" ,:controller => "administrator",:action => :destroy , :mod => :mod,:id =>:id
end