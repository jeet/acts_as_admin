class Administrator
  cattr_accessor :admin_class_names
   self.admin_class_names = Set.new

  def self.admin_classes
    self.admin_class_names.map(&:constantize)
  end
end