module Ray
  module Payloads
    class CreateLockPayload < Payload

      def initialize(name)
        @name = name
      end

      def type
        'create_lock'
      end

      def content
        {
          name: @name,
        }
      end

    end
  end
end
