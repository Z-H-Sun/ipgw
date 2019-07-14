
require "e2mmap"

module IRB

  class OutputMethod
    @RCS_ID='-$Id: output-method.rb 11708 2007-02-12 23:01:19Z shyouhei $-'

    def print(*opts)
      IRB.fail NotImplementError, "print"
    end

    def printn(*opts)
      print opts.join(" "), "\n"
    end

    def printf(format, *opts)
      if /(%*)%I/ =~ format
	format, opts = parse_printf_format(format, opts)
      end
      print sprintf(format, *opts)
    end

    def parse_printf_format(format, opts)
      return format, opts if $1.size % 2 == 1
    end

    def foo(format)
      pos = 0
      inspects = []
      format.scan(/%[#0\-+ ]?(\*(?=[^0-9])|\*[1-9][0-9]*\$|[1-9][0-9]*(?=[^0-9]))?(\.(\*(?=[^0-9])|\*[1-9][0-9]*\$|[1-9][0-9]*(?=[^0-9])))?(([1-9][0-9]*\$)*)([diouxXeEfgGcsb%])/) {|f, p, pp, pos, new_pos, c|
	puts [f, p, pp, pos, new_pos, c].join("!")
	pos = new_pos if new_pos
	if c == "I"
	  inspects.push pos.to_i 
	  (f||"")+(p||"")+(pp||"")+(pos||"")+"s"
	else
	  $&
	end
      }
    end

    def puts(*objs)
      for obj in objs
	print(*obj)
	print "\n"
      end
    end

    def pp(*objs)
      puts(*objs.collect{|obj| obj.inspect})
    end

    def ppx(prefix, *objs)
      puts(*objs.collect{|obj| prefix+obj.inspect})
    end

  end

  class StdioOutputMethod<OutputMethod
    def print(*opts)
      STDOUT.print(*opts)
    end
  end
end
