module Feedbacker #:nodoc:
  module RemarkObserverMethods
    def after_create(remark)
      puts '################################################ IN OBSERVER'
      FeedbackMailer.feedback(remark).deliver
    end
  end
end