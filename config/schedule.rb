# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :environment, 'development'
 set :output, 'log/cron_log.log'
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# rails server oprates in UTC so 12 am below is 12 am UTC
 every 1.day, at: '12:00 am' do
   rake 'gather:orders', :environment => 'development'
 end
# Learn more: http://github.com/javan/whenever
