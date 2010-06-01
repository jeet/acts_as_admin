# ActsAsAdmin
module  Acts
  module Admin

    def self.included(base) 
      base.extend ClassMethods
    end

    module  ClassMethods
      def acts_as_admin(options = {})
        return if self.included_modules.include?(Acts::Admin::InstanceMethods)

        class_inheritable_reader :non_admin_columns
        class_inheritable_reader :admin_columns
        class_inheritable_reader :admin_enabled
        if options[:only]
          except = self.column_names - options[:only].flatten.map(&:to_s)
        else
          except = [self.primary_key, inheritance_column, 'lock_version',
                    'created_at', 'updated_at', 'created_on', 'updated_on']
          except |= Array(options[:except]).collect(&:to_s) if options[:except]
        end
        admin_cols = self.column_names - except

        write_inheritable_attribute :admin_columns, admin_cols
        write_inheritable_attribute :non_admin_columns, except
        Administrator.admin_class_names << self.to_s
        
        extend Acts::Admin::SingletonMethods
        include Acts::Admin::InstanceMethods

        write_inheritable_attribute :admin_enabled, true
      end
    end


    module InstanceMethods
      def admin_attributes
        attributes.except(*non_admin_columns)
      end


    end

    private

    module SingletonMethods
      def admin_columns
        self.columns.select { |c| !non_admin_columns.include?(c.name) }
      end
    end



  end
end
