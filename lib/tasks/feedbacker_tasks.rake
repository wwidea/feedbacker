# desc "Explaining what the task does"
# task :feedbacker do
#   # Task goes here
# end

namespace :feedbacker do
  desc "bootstrap feedbacker"
  task :bootstrap  => :environment do
    require 'fileutils'
    unless File.exist?("#{Rails.root}/config/initializers/feedbacker.rb")
      FileUtils.copy(File.expand_path('../../../config/packaged_initializers/feedbacker.rb', __FILE__), "#{Rails.root}/config/initializers")
    end
    #unless File.exist?("#{RAILS_ROOT}/public/images/feedback_tab.png")
    #  FileUtils.copy("#{RAILS_ROOT}/vendor/plugins/feedbacker/public/images/feedback_tab.png","#{RAILS_ROOT}/public/images")
    #end
    #unless File.exist?("#{RAILS_ROOT}/public/images/feedback_tab_bottom.png")
    #  FileUtils.copy("#{RAILS_ROOT}/vendor/plugins/feedbacker/public/images/feedback_tab_bottom.png","#{RAILS_ROOT}/public/images")
    #end
    #unless File.exist?("#{RAILS_ROOT}/public/stylesheets/feedbacker.css")
    #  FileUtils.copy("#{RAILS_ROOT}/vendor/plugins/feedbacker/public/stylesheets/feedbacker.css","#{RAILS_ROOT}/public/stylesheets")
    #end
    #unless File.exist?("#{RAILS_ROOT}/public/javascripts/feedbacker.js")
    #  FileUtils.copy("#{RAILS_ROOT}/vendor/plugins/feedbacker/public/javascripts/feedbacker.js","#{RAILS_ROOT}/public/javascripts")
    #end
    #unless File.exist?("#{RAILS_ROOT}/db/migrate/20101230191157_create_remarks_table.rb")
    #  FileUtils.copy("#{RAILS_ROOT}/vendor/plugins/feedbacker/db/migrate/20101230191157_create_remarks_table.rb","#{RAILS_ROOT}/db/migrate")
    #  Rake::Task['db:migrate'].execute
    #end
  end
  
  ########################################################################
  ### Below task simply for use during initial building of Feedbacker, ###
  ### not intended to be used once plugin is considered complete.      ###
  ########################################################################
  
  task :debootstrap => :environment do
    if File.exist?("#{RAILS_ROOT}/config/initializers/feedbacker.rb")
      File.delete("#{RAILS_ROOT}/config/initializers/feedbacker.rb")
    end
    if File.exist?("#{RAILS_ROOT}/public/images/feedback_tab.png")
      File.delete("#{RAILS_ROOT}/public/images/feedback_tab.png")
    end
    if File.exist?("#{RAILS_ROOT}/public/images/feedback_tab_bottom.png")
      File.delete("#{RAILS_ROOT}/public/images/feedback_tab_bottom.png")
    end
    if File.exist?("#{RAILS_ROOT}/public/stylesheets/feedbacker.css")
      File.delete("#{RAILS_ROOT}/public/stylesheets/feedbacker.css")
    end
    if File.exist?("#{RAILS_ROOT}/public/javascripts/feedbacker.js")
      File.delete("#{RAILS_ROOT}/public/javascripts/feedbacker.js")
    end
    if File.exist?("#{RAILS_ROOT}/db/migrate/20101230191157_create_remarks_table.rb")
      ENV['VERSION'] = '20101230191156'
      Rake::Task['db:migrate'].execute
      File.delete("#{RAILS_ROOT}/db/migrate/20101230191157_create_remarks_table.rb")
    end
  end
end