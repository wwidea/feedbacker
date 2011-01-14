class RemarkObserver < ActiveRecord::Observer
  def after_create(remark)
    FeedbackMailer.feedback(remark).deliver
  end
end