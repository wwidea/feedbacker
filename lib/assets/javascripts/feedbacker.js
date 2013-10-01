Feedback = {
  toggle_form: function() {
    $('#compressed_feedback_form_tab').toggle();
    $('#expanded_feedback_form').toggle();
  }
}

ready = function() {
  $('a.toggle_feedback').click(function() {
    Feedback.toggle_form();
    return false;
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
