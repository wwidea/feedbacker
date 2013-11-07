Dir[File.join(File.dirname(__FILE__), '/feedbacker/*.rb')].each {|file| require file }

module Feedbacker
  class Engine < ::Rails::Engine
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end
  end
end
