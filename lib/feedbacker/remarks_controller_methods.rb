module Feedbacker
  module RemarksControllerMethods
    def create 
      @remark = current_user.remarks.new(params[:remark])
      @remark.source_url = request.env['HTTP_REFERER']
      if @remark.save
        respond_to do |format|
          format.js do 
            render :update do |page|
              page['feedback_submit_button'].hide
              page['feedback_thank_you_message'].show
              page.delay 2 do
                page.call 'Feedback.hide_form'
                page['feedback_submit_button'].show
                page['feedback_thank_you_message'].hide
              end
            end
          end
        end
      end
    end
  end
end