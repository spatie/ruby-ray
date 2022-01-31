module Ray
  module Payloads
    class NewScreenPayload < Payload
      def initialize(screen_name)
        @screen_name = screen_name
      end

      def type
        "new_screen"
      end

      def content
        {
          name: @screen_name
        }
      end
    end
  end
end
