class FeedbackMailer < ActionMailer::Base
  def feedback(remark)
    @remark = remark
    mail(:to => Feedbacker::EMAIL_TO, :from => Feedbacker::EMAIL_TO, :reply_to => remark.user.email, :subject => "#{(defined? Feedbacker::EMAIL_PREFIX) ? Feedbacker::EMAIL_PREFIX : '[FEEDBACKER]'} Feedback Notification")
  end
end
