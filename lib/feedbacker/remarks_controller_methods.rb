module Feedbacker
  module RemarksControllerMethods
    def create 
      @remark = Remark.new(params[:remark].merge(:user_id => current_user.id))
      @remark.source_url = request.env['HTTP_REFERER']
      if @remark.save
        respond_to do |format|
          format.js
        end
      end
    end
  end
end