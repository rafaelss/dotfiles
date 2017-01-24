# encoding: utf-8
require "irb/completion"
require "irb/ext/save-history"

#ARGV.concat ["--prompt-mode", "simple"]

IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

if defined?(ActiveRecord::Base)
  require "logger"
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.clear_active_connections!
end

require "awesome_print"
AwesomePrint.irb!

def pager(obj)
  obj = obj.ai unless obj.is_a?(String) || obj.is_a?(Fixnum) || obj.is_a?(Bignum) || obj.is_a?(Float)
  File.open("/tmp/irb-pager.txt", "wb") { |f| f.write(obj) }

  fork { exec("cat /tmp/irb-pager.txt | most") }
  Process.wait

  File.delete("/tmp/irb-pager.txt")
  nil
end

def require_as!
  require "active_support"
  require "active_support/core_ext"
end
