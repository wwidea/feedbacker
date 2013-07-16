require 'test_helper'
require File.expand_path('../../lib/feedbacker/remark_methods', __FILE__)

class RemarkMethodsTest < ActiveSupport::TestCase
  
  test "should send user_name_method to user" do
    instance = remark_methods_class.new(return_send_class.new)
    
    assert_equal 'name method', instance.user_name
  end

  private
  
  def remark_methods_class
    @remark_methods_class ||= Class.new do
      attr_accessor :user
      
      def self.belongs_to(*args)
      end
      
      def initialize(user)
        self.user = user
      end
      
      include Feedbacker::RemarkMethods
    end
  end
  
  def return_send_class
    Class.new do
      def name
        "name method"
      end
    end
  end
end
