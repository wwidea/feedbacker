module Feedbacker #:nodoc:
  module RemarkMethods
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        include InstanceMethods
        
        belongs_to :user
        after_create :send_email
      end
    end
    
    module ClassMethods

    end
    
    module InstanceMethods
      
      def user_name
        if defined? USER_NAME_METHOD
          return user.send(USER_NAME_METHOD)
        else
          user.name
        end
      end
      
      #######
      private
      #######
      
      def send_email
        AutoMailer.deliver_html_mail(
          :template => :feedback_notification,
          :recipient => 'support@wwidea.org',
          :sender => 'support@wwidea.org',
          :reply_to => self.user.email,
          :subject => "#{(defined? FEEDBACKER_EMAIL_PREFIX) ? FEEDBACKER_EMAIL_PREFIX : '[FEEDBACKER]'} Feedback Notification",
          :assigns => {:remark => self}
        )
      end
    end
  end
end