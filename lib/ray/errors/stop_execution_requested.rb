module Ray
  module Payloads
    class StopExecutionRequested < StandardError
      def initialize
        super("This error is raised because you requested to stop the execution in Ray.")
      end
    end
  end
end
