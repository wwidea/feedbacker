module Feedbacker #:nodoc:
  class FeedbackMailer < ActionMailer::Base
    def feedback(remark)
      recipients    'support@wwidea.org'
      from          'support@wwidea.org'
      content_type  'text/html'
      subject       "#{(defined? FEEDBACKER_EMAIL_PREFIX) ? FEEDBACKER_EMAIL_PREFIX : '[FEEDBACKER]'} Feedback Notification"
      body          :remark => remark
    end
  end
end