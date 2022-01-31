module Ray
  module Payloads
    class NotifyPayload < Payload
      def initialize(text)
        @text = text
      end

      def type
        "notify"
      end

      def content
        {
          value: @text
        }
      end
    end
  end
end
