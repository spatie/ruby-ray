module Ray
  module Payloads
    class JsonStringPayload < Payload

      def initialize(value)
        @value = value
      end

      def type
        'json_string'
      end

      def content
        {
          value: @value.to_json,
        }
      end

    end
  end
end
