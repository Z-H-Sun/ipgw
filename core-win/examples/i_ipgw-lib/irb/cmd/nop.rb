module IRB
  module ExtendCommand
    class Nop
      
      @RCS_ID='-$Id: nop.rb 11708 2007-02-12 23:01:19Z shyouhei $-'

      def self.execute(conf, *opts)
	command = new(conf)
	command.execute(*opts)
      end

      def initialize(conf)
	@irb_context = conf
      end

      attr_reader :irb_context

      def irb
	@irb_context.irb
      end

      def execute(*opts)
	#nop
      end
    end
  end
end

