module Ray
  module Payloads
    class BoolPayload < Payload
      def initialize(bool)
        @name = bool
      end

      def type
        "custom"
      end

      def content
        {
          content: @name,
          label: "Boolean"
        }
      end
    end
  end
end
