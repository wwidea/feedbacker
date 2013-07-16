module Feedbacker #:nodoc:
  module RemarkMethods
    def self.included(base)
      base.class_eval do
        belongs_to :user
      end
    end
    
    def user_name
      return user.send(Feedbacker::SETTINGS.user_name_method)
    end
  end
end
