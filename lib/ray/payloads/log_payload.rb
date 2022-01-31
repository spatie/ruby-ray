module Ray
  module Payloads
    class LogPayload < Payload
      def initialize(values)
        @values = values
      end

      def type
        "log"
      end

      def content
        {
          values: @values.map { |value| value.to_json }
        }
      end
    end
  end
end
