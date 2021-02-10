module Ray
  module Payloads
    class BoolPayload < Payload

      def initialize(bool)
        @bool = bool
      end

      def type
        "custom"
      end

      def content
        {
          content: @bool,
          label: "Boolean"
        }
      end

    end
  end
end
