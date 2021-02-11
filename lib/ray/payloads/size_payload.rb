module Ray
  module Payloads
    class SizePayload < Payload

      def initialize(size)
        @size = size
      end

      def type
        'size'
      end

      def content
        {
          size: @size,
        }
      end

    end
  end
end

