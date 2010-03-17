# desc "Explaining what the task does"
# task :feedbacker do
#   # Task goes here
# end

namespace :feedbacker do
  task :bootstrap  => :environment do
    unless File.exist?("#{RAILS_ROOT}/db/migrate/20091105214528_create_remarks_table.rb")
      require 'fileutils'
      File.copy("#{RAILS_ROOT}/vendor/plugins/feedbacker/db/migrate/20091105214528_create_remarks_table.rb","#{RAILS_ROOT}/db/migrate")
      Rake::Task['db:migrate'].execute
    end
  end
  
  #simply for use during initial building of Feedbacker, not intended to be used once plugin is considered complete.
  task :debootstrap => :environment do
    if File.exist?("#{RAILS_ROOT}/db/migrate/20091105214528_create_remarks_table.rb")
      ENV['VERSION'] = '20091023213611'
      Rake::Task['db:migrate'].execute
      File.delete("#{RAILS_ROOT}/db/migrate/20091105214528_create_remarks_table.rb")
    end
  end
end