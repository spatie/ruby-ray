module Ray
  module Payloads
    class Payload

      def initialize(value)
      end

      def type
        raise NotImplementedError, "You must define the `type` method in your Payload"
      end

      def content
        raise NotImplementedError, "You must define the `content` method in your Payload"
      end

    end
  end
end
