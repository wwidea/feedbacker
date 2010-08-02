module Feedbacker #:nodoc:
  module RemarkObserverMethods
    def after_create(remark)
      FeedbackMailer.deliver_feedback(remark)
    end
  end
end