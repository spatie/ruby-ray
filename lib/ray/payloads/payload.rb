module Ray
  module Payloads
    class Payload

      def initialize(*args)
      end

      def type
        raise NotImplementedError, 'You must define the `type` method in your Payload'
      end

      def content
        {}
      end

    end
  end
end
