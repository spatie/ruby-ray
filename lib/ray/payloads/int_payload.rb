module Ray
  module Payloads
    class IntPayload < Payload

      def initialize(int)
        @int = int
      end

      def type
        'custom'
      end

      def content
        {
          content: @int,
          label: 'Integer'
        }
      end

    end
  end
end
