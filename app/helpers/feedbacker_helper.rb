module FeedbackerHelper
  def show_feedback
    "$('expanded_feedback_form').show(); $('compressed_feedback_form_tab').hide();"
  end
  
  def hide_feedback
    "$('compressed_feedback_form_tab').show(); $('expanded_feedback_form').hide();"
  end
end