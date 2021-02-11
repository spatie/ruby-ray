module Ray
  module Payloads
    class NewScreenPayload < Payload

      def initialize(screenName)
        @screenName = screenName
      end

      def type
        'new_screen'
      end

      def content
        {
          name: @screenName,
        }
      end

    end
  end
end
