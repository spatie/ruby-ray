module Ray
  module Payloads
    class CustomPayload < Payload

      def initialize(content, label = '')
        @content = content
        @label = label
      end

      def type
        "custom"
      end

      def content
        {
          content: @content,
          label: @label
        }
      end
    end
  end
end
