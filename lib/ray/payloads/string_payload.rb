module Ray
  module Payloads
    class StringPayload < Payload
      def initialize(str)
        @str = str
      end

      def type
        "custom"
      end

      def content
        {
          content: @str,
          label: "String"
        }
      end
    end
  end
end
