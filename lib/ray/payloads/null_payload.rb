module Ray
  module Payloads
    class NullPayload < Payload

      def type
        "custom"
      end

      def content
        {
          content: nil,
          label: "Integer"
        }
      end

    end
  end
end
