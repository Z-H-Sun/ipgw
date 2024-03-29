#!/usr/local/bin/ruby

require "readline"

module IRB
  module HistorySavingAbility
    @RCS_ID='-$Id: save-history.rb 24483 2009-08-09 08:44:15Z shyouhei $-'
  end

  class Context
    def init_save_history
      unless (class<<@io;self;end).include?(HistorySavingAbility)
	@io.extend(HistorySavingAbility)
      end
    end

    def save_history
      IRB.conf[:SAVE_HISTORY]
    end

    def save_history=(val)
      IRB.conf[:SAVE_HISTORY] = val
      if val
	main_context = IRB.conf[:MAIN_CONTEXT]
	main_context = self unless main_context
	main_context.init_save_history
      end
    end

    def history_file
      IRB.conf[:HISTORY_FILE]
    end

    def history_file=(hist)
      IRB.conf[:HISTORY_FILE] = hist
    end
  end

  module HistorySavingAbility
    include Readline


    def HistorySavingAbility.extended(obj)
      IRB.conf[:AT_EXIT].push proc{obj.save_history}
      obj.load_history
      obj
    end

    def load_history
      hist = IRB.conf[:HISTORY_FILE]
      hist = IRB.rc_file("_history") unless hist
      if File.exist?(hist)
	open(hist) do |f|
	  f.each {|l| HISTORY << l.chomp}
	end
      end
    end

    def save_history
      if num = IRB.conf[:SAVE_HISTORY] and (num = num.to_i) > 0
	if history_file = IRB.conf[:HISTORY_FILE]
	  history_file = File.expand_path(history_file)
	end
	history_file = IRB.rc_file("_history") unless history_file
	open(history_file, 'w' ) do |f|
	  hist = HISTORY.to_a
	  f.puts(hist[-num..-1] || hist)
	end
      end
    end
  end
end

