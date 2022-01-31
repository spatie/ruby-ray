module Ray
  module Payloads
    class ColorPayload < Payload
      def initialize(color)
        @color = color
      end

      def type
        "color"
      end

      def content
        {
          color: @color
        }
      end
    end
  end
end
