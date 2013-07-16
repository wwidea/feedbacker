class FeedbackMailer < ActionMailer::Base
  def feedback(remark)
    @remark = remark
    mail(
      to:         Feedbacker::SETTINGS.email_to,
      from:       Feedbacker::SETTINGS.email_to,
      reply_to:   remark.user.email,
      subject:    "#{Feedbacker::SETTINGS.email_prefix} Feedback Notification"
    )
  end
end
