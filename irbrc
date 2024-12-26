# frozen_string_literal: true

require "irb/completion"
require "irb/ext/save-history"

IRB.conf[:SAVE_HISTORY] = 500
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:BACK_TRACE_LIMIT] = 100
IRB.conf[:USE_MULTILINE] = false

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
