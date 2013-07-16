require 'test_helper'
require File.expand_path('../../lib/feedbacker/settings', __FILE__)

class SettingsTest < ActiveSupport::TestCase

  test "should return default values" do
    settings = Feedbacker::Settings.new
    
    assert_equal '', settings.email_to
    assert_equal '[FEEDBACKER]', settings.email_prefix
    assert_equal :name, settings.user_name_method
  end
  
  test "should assign new value to setting" do
    settings = Feedbacker::Settings.new
    settings.email_to = 'testing@mail.com'
    
    assert_equal 'testing@mail.com', settings.email_to
  end
  
  test 'should update setting' do
    settings = Feedbacker::Settings.new
    settings.update do |settings|
      settings.email_to = 'me@mail.com'
    end
    
    assert_equal 'me@mail.com', settings.email_to
  end
  
  test 'should return default value from SETTINGS constant' do
    assert_equal '[FEEDBACKER]', Feedbacker::SETTINGS.email_prefix
  end
end
