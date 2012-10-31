# encoding: utf-8
require "irb/completion"
require "irb/ext/save-history"

ARGV.concat ["--readline", "--prompt-mode", "simple"]

IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

if defined?(ActiveRecord::Base)
  require "logger"
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.clear_active_connections!
end

def switch_schema(name)
  Apartment::Database.switch(name.to_s)
end if defined?(Apartment::Database)
