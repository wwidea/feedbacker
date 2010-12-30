class FeedbackMailer < ActionMailer::Base
  def feedback(remark)
    @remark = remark
    mail(:to => "support@wwidea.org", :from => 'support@wwidea.org', :reply_to => remark.user.email, :subject => "#{(defined? FEEDBACKER_EMAIL_PREFIX) ? FEEDBACKER_EMAIL_PREFIX : '[FEEDBACKER]'} Feedback Notification")
  end
end
