module Feedbacker #:nodoc:
  module RemarkMethods
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        include InstanceMethods
        
        belongs_to :user
      end
    end
    
    module ClassMethods

    end
    
    module InstanceMethods
      
      def user_name
        if defined? Feedbacker::RemarkMethods::USER_NAME_METHOD
          return user.send(Feedbacker::RemarkMethods::USER_NAME_METHOD)
        else
          user.name
        end
      end
      
    end
  end
end