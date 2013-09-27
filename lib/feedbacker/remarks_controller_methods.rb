module Feedbacker
  module RemarksControllerMethods
    def create 
      @remark = Remark.new(remark_params.merge(:user_id => current_user.id))
      @remark.source_url = request.env['HTTP_REFERER']
      if @remark.save
        FeedbackMailer.feedback(@remark).deliver
        respond_to do |format|
          format.js
        end
      end
    end
    
    private
    
    def remark_params
      params.respond_to?(:permit) ? params.require(:remark).permit(:content) : params[:remark]
    end
  end
end
